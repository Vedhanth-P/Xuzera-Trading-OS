#property strict
#property version   "1.00"
#property description "Price-action XAUUSD EA with risk limits and CSV trade journal. Trading disabled by default."

#include <Trade/Trade.mqh>
CTrade trade;

input bool   EnableTrading=false;           // Explicitly enable only after demo validation
input string TradeSymbol="";               // Empty means chart symbol
input ENUM_TIMEFRAMES SignalTimeframe=PERIOD_M15;
input double RiskPercent=1.0;
input double DailyLossLimitPercent=3.0;
input int    MaxTradesPerDay=3;
input double RewardRisk=2.0;
input int    EmaPeriod=50;
input int    AtrPeriod=14;
input double MinATRPoints=50;
input double MaxATRPoints=1500;
input int    MaxSpreadPoints=80;
input double BreakEvenAtR=1.0;
input double TrailAtR=1.5;
input double TrailDistanceR=1.0;
input ulong  MagicNumber=85101301;
input string JournalFile="TradeJournal.csv";
input string ScreenshotFolder="Screenshots";
input string HeartbeatFile="GoldTradingControlCenter_EA.txt";

string Sym;
int hEma=INVALID_HANDLE, hAtr=INVALID_HANDLE;
datetime lastBar=0;

string DayKey(datetime t)
{
   MqlDateTime x; TimeToStruct(t,x);
   return StringFormat("%I64d_%04d%02d%02d",(long)AccountInfoInteger(ACCOUNT_LOGIN),x.year,x.mon,x.day);
}
double DayStartEquity()
{
   string key="GTC_EQ_"+DayKey(TimeCurrent());
   if(!GlobalVariableCheck(key)) GlobalVariableSet(key,AccountInfoDouble(ACCOUNT_EQUITY));
   return GlobalVariableGet(key);
}
void EnsureJournal()
{
   int f=FileOpen(JournalFile,FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_COMMON,',');
   if(f==INVALID_HANDLE) { Print("Journal open failed: ",GetLastError()); return; }
   if(FileSize(f)==0)
   {
      FileWrite(f,"Trade ID","Ticket Number","Date","Open Time","Close Time","Trade Duration","Symbol","Trade Type","Lot Size","Entry Price","Stop Loss","Take Profit","Exit Price","Profit/Loss","Account Currency","Spread","Risk %","Win/Loss","Strategy Name","Signal Type","Entry Reason","Exit Reason","Exit Comment","Screenshot","R Multiple","Balance","Equity");
   }
   FileClose(f);
}
void WriteHeartbeat(bool stopped=false)
{
   int f=FileOpen(HeartbeatFile,FILE_WRITE|FILE_TXT|FILE_ANSI|FILE_COMMON);
   if(f==INVALID_HANDLE) return;
   string mode=stopped?"STOPPED":(EnableTrading?"ORDERS_ENABLED":"MONITOR_ONLY");
   string line=(stopped?"STOPPED":TimeToString(TimeLocal(),TIME_DATE|TIME_SECONDS))+"|"+Sym+"|"+mode;
   FileWriteString(f,line); FileClose(f);
}
void AppendRow(string id,string ticket,string day,string openTime,string closeTime,string duration,string symbol,string side,string lots,string entry,string sl,string tp,string exitPrice,string pnl,string currency,string spread,string risk,string result,string strategy,string signal,string entryReason,string exitReason,string comment,string screenshot,string rMultiple)
{
   EnsureJournal();
   int f=FileOpen(JournalFile,FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_COMMON,',');
   if(f==INVALID_HANDLE) { Print("Journal write failed: ",GetLastError()); return; }
   FileSeek(f,0,SEEK_END);
   FileWrite(f,id,ticket,day,openTime,closeTime,duration,symbol,side,lots,entry,sl,tp,exitPrice,pnl,currency,spread,risk,result,strategy,signal,entryReason,exitReason,comment,screenshot,rMultiple,DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2),DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2));
   FileClose(f);
}
double NormalizeVolume(double volume)
{
   double step=SymbolInfoDouble(Sym,SYMBOL_VOLUME_STEP),minv=SymbolInfoDouble(Sym,SYMBOL_VOLUME_MIN),maxv=SymbolInfoDouble(Sym,SYMBOL_VOLUME_MAX);
   if(step<=0) return 0;
   volume=MathFloor(volume/step)*step;
   if(volume<minv) return 0; return MathMin(volume,maxv);
}
double LotsForRisk(double entry,double stop)
{
   double distance=MathAbs(entry-stop),tickSize=SymbolInfoDouble(Sym,SYMBOL_TRADE_TICK_SIZE),tickValue=SymbolInfoDouble(Sym,SYMBOL_TRADE_TICK_VALUE);
   if(distance<=0 || tickSize<=0 || tickValue<=0) return 0;
   double cashPerLot=distance/tickSize*tickValue;
   return NormalizeVolume(AccountInfoDouble(ACCOUNT_EQUITY)*RiskPercent/100.0/cashPerLot);
}
int TradesToday()
{
   MqlDateTime x; TimeToStruct(TimeCurrent(),x); x.hour=0; x.min=0; x.sec=0; datetime from=StructToTime(x);
   if(!HistorySelect(from,TimeCurrent())) return 0;
   int count=0; ulong seen[];
   for(int i=0;i<HistoryDealsTotal();i++)
   {
      ulong d=HistoryDealGetTicket(i); if(d==0 || HistoryDealGetString(d,DEAL_SYMBOL)!=Sym || (ulong)HistoryDealGetInteger(d,DEAL_MAGIC)!=MagicNumber) continue;
      if(HistoryDealGetInteger(d,DEAL_ENTRY)==DEAL_ENTRY_IN) count++;
   }
   return count;
}
bool HasPosition()
{
   for(int i=PositionsTotal()-1;i>=0;i--){ulong ticket=PositionGetTicket(i); if(ticket>0 && PositionGetString(POSITION_SYMBOL)==Sym && (ulong)PositionGetInteger(POSITION_MAGIC)==MagicNumber) return true;}
   return false;
}
void Capture(string side,ulong ticket,string &path)
{
   FolderCreate(ScreenshotFolder); path=ScreenshotFolder+"\\"+side+"_"+IntegerToString((long)ticket)+".png";
   if(!ChartScreenShot(ChartID(),path,1280,720,ALIGN_RIGHT)) { Print("Screenshot failed: ",GetLastError()); path=""; }
}
void ManagePositions()
{
   for(int i=PositionsTotal()-1;i>=0;i--)
   {
      ulong ticket=PositionGetTicket(i); if(ticket==0 || PositionGetString(POSITION_SYMBOL)!=Sym || (ulong)PositionGetInteger(POSITION_MAGIC)!=MagicNumber) continue;
      long type=PositionGetInteger(POSITION_TYPE); double open=PositionGetDouble(POSITION_PRICE_OPEN),sl=PositionGetDouble(POSITION_SL),tp=PositionGetDouble(POSITION_TP);
      if(sl<=0) continue;
      double initialR=MathAbs(open-sl); if(initialR<=0) continue;
      double bid=SymbolInfoDouble(Sym,SYMBOL_BID),ask=SymbolInfoDouble(Sym,SYMBOL_ASK),price=(type==POSITION_TYPE_BUY?bid:ask);
      double gain=(type==POSITION_TYPE_BUY?price-open:open-price); double r=gain/initialR; double nextSL=sl;
      if(r>=BreakEvenAtR) { double be=open; if((type==POSITION_TYPE_BUY && be>nextSL)||(type==POSITION_TYPE_SELL && be<nextSL)) nextSL=be; }
      if(r>=TrailAtR) { double trail=(type==POSITION_TYPE_BUY?price-TrailDistanceR*initialR:price+TrailDistanceR*initialR); if((type==POSITION_TYPE_BUY && trail>nextSL)||(type==POSITION_TYPE_SELL && trail<nextSL)) nextSL=trail; }
      int digits=(int)SymbolInfoInteger(Sym,SYMBOL_DIGITS); nextSL=NormalizeDouble(nextSL,digits);
      if(MathAbs(nextSL-sl)>=SymbolInfoDouble(Sym,SYMBOL_POINT) && ((type==POSITION_TYPE_BUY && nextSL<bid)||(type==POSITION_TYPE_SELL && nextSL>ask))) trade.PositionModify(ticket,nextSL,tp);
   }
}
void CheckEntry()
{
   if(!EnableTrading || !TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) || !MQLInfoInteger(MQL_TRADE_ALLOWED)) return;
   double start=DayStartEquity(); if(start<=0 || AccountInfoDouble(ACCOUNT_EQUITY)<=start*(1.0-DailyLossLimitPercent/100.0)) return;
   if(TradesToday()>=MaxTradesPerDay || HasPosition()) return;
   double ask=SymbolInfoDouble(Sym,SYMBOL_ASK),bid=SymbolInfoDouble(Sym,SYMBOL_BID),point=SymbolInfoDouble(Sym,SYMBOL_POINT);
   int spread=(int)MathRound((ask-bid)/point); if(spread>MaxSpreadPoints) return;
   double ema[],atr[]; ArraySetAsSeries(ema,true); ArraySetAsSeries(atr,true);
   if(CopyBuffer(hEma,0,1,1,ema)!=1 || CopyBuffer(hAtr,0,1,1,atr)!=1) return;
   MqlRates bars[]; ArraySetAsSeries(bars,true); if(CopyRates(Sym,SignalTimeframe,1,1,bars)!=1) return;
   double atrPoints=atr[0]/point; if(atrPoints<MinATRPoints || atrPoints>MaxATRPoints) return;
   double stopDist=atr[0]; long stopsLevel=SymbolInfoInteger(Sym,SYMBOL_TRADE_STOPS_LEVEL); stopDist=MathMax(stopDist,(stopsLevel+2)*point);
   bool buy=(bars[0].close>bars[0].open && ask>bars[0].high && ask>ema[0]);
   bool sell=(bars[0].close<bars[0].open && bid<bars[0].low && bid<ema[0]);
   if(!buy && !sell) return;
   double entry=buy?ask:bid,sl=buy?entry-stopDist:entry+stopDist,tp=buy?entry+RewardRisk*stopDist:entry-RewardRisk*stopDist;
   int digits=(int)SymbolInfoInteger(Sym,SYMBOL_DIGITS); sl=NormalizeDouble(sl,digits); tp=NormalizeDouble(tp,digits);
   double lots=LotsForRisk(entry,sl); if(lots<=0) { Print("Risk-sized volume is below broker minimum; no trade sent."); return; }
   trade.SetExpertMagicNumber(MagicNumber); trade.SetDeviationInPoints(20);
   bool sent=buy?trade.Buy(lots,Sym,0,sl,tp,"PA breakout buy"):trade.Sell(lots,Sym,0,sl,tp,"PA breakout sell");
   if(!sent || (trade.ResultRetcode()!=TRADE_RETCODE_DONE && trade.ResultRetcode()!=TRADE_RETCODE_PLACED)) { Print("Order rejected: ",trade.ResultRetcodeDescription()); return; }
   ulong deal=trade.ResultDeal(),order=trade.ResultOrder(); ulong posTicket=order;
   if(deal>0 && HistoryDealSelect(deal)) posTicket=(ulong)HistoryDealGetInteger(deal,DEAL_POSITION_ID);
   string screenshot=""; Capture(buy?"BUY":"SELL",posTicket,screenshot);
   string reasons=(buy?"Previous candle bullish; breakout above previous high; above EMA50; ATR filter passed; spread filter passed":"Previous candle bearish; breakout below previous low; below EMA50; ATR filter passed; spread filter passed");
   string signal=buy?"Bullish breakout":"Bearish breakout";
   AppendRow(IntegerToString((long)deal),IntegerToString((long)posTicket),TimeToString(TimeCurrent(),TIME_DATE),TimeToString(TimeCurrent(),TIME_DATE|TIME_SECONDS),"","",Sym,buy?"BUY":"SELL",DoubleToString(lots,2),DoubleToString(entry,digits),DoubleToString(sl,digits),DoubleToString(tp,digits),"","",AccountInfoString(ACCOUNT_CURRENCY),IntegerToString(spread),DoubleToString(RiskPercent,2),"","Price Action EMA50 Breakout",signal,reasons,"","",screenshot,"");
}
int OnInit()
{
   Sym=(TradeSymbol==""?_Symbol:TradeSymbol); if(!SymbolSelect(Sym,true)) return INIT_FAILED;
   hEma=iMA(Sym,SignalTimeframe,EmaPeriod,0,MODE_EMA,PRICE_CLOSE); hAtr=iATR(Sym,SignalTimeframe,AtrPeriod);
   if(hEma==INVALID_HANDLE || hAtr==INVALID_HANDLE) return INIT_FAILED;
   EnsureJournal(); DayStartEquity(); trade.SetExpertMagicNumber(MagicNumber); EventSetTimer(2); WriteHeartbeat(); return INIT_SUCCEEDED;
}
void OnDeinit(const int reason){ EventKillTimer(); WriteHeartbeat(true); if(hEma!=INVALID_HANDLE) IndicatorRelease(hEma); if(hAtr!=INVALID_HANDLE) IndicatorRelease(hAtr); }
void OnTick(){ ManagePositions(); CheckEntry(); }
void OnTimer(){ WriteHeartbeat(); }
void OnTradeTransaction(const MqlTradeTransaction &trans,const MqlTradeRequest &request,const MqlTradeResult &result)
{
   if(trans.type!=TRADE_TRANSACTION_DEAL_ADD || trans.deal==0) return;
   if(!HistoryDealSelect(trans.deal)) return;
   ulong deal=trans.deal; if(HistoryDealGetString(deal,DEAL_SYMBOL)!=Sym || (ulong)HistoryDealGetInteger(deal,DEAL_MAGIC)!=MagicNumber) return;
   long entry=HistoryDealGetInteger(deal,DEAL_ENTRY); if(entry!=DEAL_ENTRY_OUT && entry!=DEAL_ENTRY_OUT_BY) return;
   double pnl=HistoryDealGetDouble(deal,DEAL_PROFIT)+HistoryDealGetDouble(deal,DEAL_SWAP)+HistoryDealGetDouble(deal,DEAL_COMMISSION);
   long why=HistoryDealGetInteger(deal,DEAL_REASON); string reason="Manual Close";
   if(why==DEAL_REASON_TP) reason="Take Profit Hit"; else if(why==DEAL_REASON_SL) reason="Stop Loss Hit / Break Even / Trailing Stop"; else if(why==DEAL_REASON_CLIENT || why==DEAL_REASON_MOBILE || why==DEAL_REASON_WEB) reason="Manual Close";
   string side=HistoryDealGetInteger(deal,DEAL_TYPE)==DEAL_TYPE_SELL?"BUY":"SELL";
   double price=HistoryDealGetDouble(deal,DEAL_PRICE); int digits=(int)SymbolInfoInteger(Sym,SYMBOL_DIGITS);
   AppendRow(IntegerToString((long)deal),IntegerToString((long)HistoryDealGetInteger(deal,DEAL_POSITION_ID)),TimeToString((datetime)HistoryDealGetInteger(deal,DEAL_TIME),TIME_DATE),"",TimeToString((datetime)HistoryDealGetInteger(deal,DEAL_TIME),TIME_DATE|TIME_SECONDS),"",Sym,side,DoubleToString(HistoryDealGetDouble(deal,DEAL_VOLUME),2),"","","",DoubleToString(price,digits),DoubleToString(pnl,2),AccountInfoString(ACCOUNT_CURRENCY),"",DoubleToString(RiskPercent,2),pnl>0?"Win":(pnl<0?"Loss":"Flat"),"Price Action EMA50 Breakout","Exit", "",reason,EnumToString((ENUM_DEAL_REASON)why),"", "");
}
