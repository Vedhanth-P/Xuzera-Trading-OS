# Xuzera — complete feature coverage

This file preserves every heading and requested item from the supplied feature list. The status under each heading describes the current implementation and its limits. “Available” means implemented with the connected local/broker data; it does not imply external accounts or data providers are configured.

**Safety rule:** values are not invented when a broker/provider is unavailable. Order submission, EA pausing, tax calculation/filing, customer onboarding, and paid marketplace functions require separate safe integrations and qualified review.

## GOLD TRADING CONTROL CENTER / TRADING OS

Coverage status not yet assessed; see the relevant in-app page and service setup requirements.


## ACCOUNT OVERVIEW

Live account values and connection status are implemented through MT5; health/risk scores are descriptive only and not predictive.

- Balance
- Equity
- Free Margin
- Used Margin
- Margin Level
- Daily P&L
- Weekly P&L
- Monthly P&L
- Floating P&L
- Closed P&L
- Open Trades Count
- Closed Trades Count
- Win Rate
- Loss Rate
- Profit Factor
- Account Health Score
- Risk Score
- Trading Status
- Broker Status
- MT5 Connection Status

## EQUITY & PERFORMANCE ANALYTICS

Equity/history analytics are available; forecast and growth projection are not offered as predictive facts.

- Real-Time Equity Curve
- Balance Curve
- Drawdown Curve
- Current Drawdown
- Maximum Drawdown
- Daily Drawdown
- Weekly Drawdown
- Monthly Drawdown
- Equity Peak Tracking
- Recovery Factor
- Return Over Time
- Profit Timeline
- Equity Forecast
- Growth Projection

## TRADE ANALYTICS

Core trade analytics and grouping are available; confidence/quality/market-condition scores are not fabricated.

- Average Trade Profit
- Average Trade Loss
- Largest Win
- Largest Loss
- Average RR
- Open Trade Analysis
- Closed Trade Analysis
- Winning Trade Breakdown
- Losing Trade Breakdown
- Trade Duration Analytics
- Win Streak
- Loss Streak
- Trade Heatmap
- Hour-wise Performance
- Day-wise Performance
- Week-wise Performance
- Month-wise Performance
- Symbol-wise Performance
- Trade Quality Score
- Trade Confidence Score
- Market Condition Analysis

## OPEN POSITION MANAGEMENT

Live monitor, distance, risk/reward, and age are available. MFE/MAE replay is newly available; health score is not a validated model.

- Position Monitor
- Distance To Stop Loss
- Distance To Take Profit
- Remaining Risk
- Remaining Reward
- Live Risk Reward Ratio
- Maximum Favorable Excursion
- Maximum Adverse Excursion
- Position Age
- Position Health Score

## EA MANAGEMENT CENTER

History-based leaderboard and existing heartbeat/logs are available. EA controls, version inventory, runtime/reliability grading/allocation require a safe EA agent protocol.

- EA Leaderboard
- Profit Ranking
- Win Rate Ranking
- Drawdown Ranking
- Reliability Ranking
- EA Grading System
- EA Health Monitor
- EA Runtime Monitor
- EA Error Logs
- EA Restart Controls
- EA Version Tracking
- EA Change Logs
- EA Risk Analysis
- EA Performance Timeline
- EA Portfolio Allocation

## STRATEGY CENTER

Comparison and 70/30 descriptive split are available. Sharpe/Sortino/correlation/walk-forward/optimizer require validated daily series and test harness.

- Strategy Comparison
- Multi EA Comparison
- Sharpe Ratio
- Sortino Ratio
- Profit Factor Analysis
- Drawdown Analysis
- Stability Analysis
- Strategy Life Cycle
- Strategy Optimizer
- Diversification Score
- Strategy Correlation Matrix
- Walk Forward Validation

## SESSION ANALYTICS

Session reports are available from broker timestamps; overlaps are double-counted and no recommendation engine is claimed.

- Asian Session Report
- London Session Report
- New York Session Report
- Session Overlap Analysis
- Session Profitability
- Session Win Rates
- Session Risk Levels
- Best Session Detection
- Worst Session Detection
- Session Recommendations

## MARKET INTELLIGENCE

Economic calendar, news feed, severity, and alert windows are integrated. Auto trading controls remain disabled.

- Economic Calendar
- High Impact News Feed
- USD Event Monitor
- Gold Event Monitor
- Volatility Meter
- News Impact Score
- Market Sentiment Score
- Risk News Alerts
- Auto Trading Pause Rules

## MAJOR NEWS TRACKERS

Trackers use available calendar event names/categories; event coverage depends on provider publication.

- CPI Tracker
- Core CPI Tracker
- PPI Tracker
- Core PPI Tracker
- NFP Tracker
- ADP Employment Tracker
- FOMC Tracker
- Federal Reserve Speech Tracker
- ECB Rate Decision Tracker
- BOE Rate Decision Tracker
- BOJ Rate Decision Tracker
- RBA Rate Decision Tracker
- BOC Rate Decision Tracker
- GDP Tracker
- Retail Sales Tracker
- PMI Tracker
- Manufacturing PMI Tracker
- Services PMI Tracker
- Jobless Claims Tracker
- Consumer Confidence Tracker
- ISM Manufacturing Tracker
- ISM Services Tracker
- US Treasury Auction Tracker

## COUNTDOWN TIMERS

Countdowns are driven by available upcoming calendar events; coverage depends on provider.

- Next CPI Countdown
- Next Core CPI Countdown
- Next PPI Countdown
- Next NFP Countdown
- Next ADP Countdown
- Next FOMC Countdown
- Next Federal Reserve Speech Countdown
- Next GDP Countdown
- Next PMI Countdown
- Next Major Gold Event Countdown
- Next USD Event Countdown
- Next Red Folder News Countdown

## NEWS ALERTS

In-browser alerts and event windows are available; external delivery providers require setup.

- 24 Hour News Alert
- 12 Hour News Alert
- 4 Hour News Alert
- 1 Hour News Alert
- 30 Minute News Alert
- 15 Minute News Alert
- 5 Minute News Alert
- Event Started Alert
- Event Ended Alert

## EVENT SEVERITY SYSTEM

Calendar events are grouped by provider impact labels; impact is not a price-direction prediction.

- Low Impact Events
- Medium Impact Events
- High Impact Events
- Critical Impact Events
- Color Coded Alert System

## GOLD INTELLIGENCE CENTER

Calendar/news and broker gold chart are available; licensed COMEX/inventory and measured sentiment/forecast are not connected.

- Gold Impact Score
- XAUUSD Volatility Forecast
- Gold Risk Meter
- Safe Haven Sentiment
- Central Bank Gold News
- COMEX Monitoring
- Precious Metals Dashboard

## USD INTELLIGENCE CENTER

USD event monitoring is available; DXY and volatility feeds require market-data provider access.

- Dollar Strength Meter
- DXY Tracker
- USD Sentiment Engine
- USD Volatility Index
- USD Risk Score

## CENTRAL BANK MONITORING

Calendar/headline tracking is available subject to provider coverage.

- Jerome Powell Alerts
- FOMC Press Conference Alerts
- ECB Press Conference Alerts
- BOE Alerts
- Major Banker Speech Alerts

## AI NEWS INTERPRETER

Local assistant may explain context; AI output is informational and not a measured volatility prediction.

- Explain News Impact
- Explain Impact On Gold
- Explain Impact On USD
- Explain Impact On Open Trades
- AI News Summaries
- AI Market Breakdown
- AI Volatility Predictions

## AUTOMATED TRADING PROTECTION

Not active: safe MT5/EA command channel and fail-safe rules are absent.

- Auto Pause Before CPI
- Auto Pause Before NFP
- Auto Pause Before FOMC
- Auto Pause Before Major News
- Auto Reduce Position Size
- Auto Close Partial Positions
- Auto Disable Risky EAs

## HISTORICAL NEWS ANALYTICS

Not active: verified historical event-surprise and aligned market-reaction database is absent.

- Historical CPI Database
- Historical NFP Database
- Historical FOMC Database
- Historical Gold Reactions
- Historical USD Reactions
- Average Gold Move After CPI
- Average Gold Move After NFP
- Average Gold Move After FOMC

## NEWS DELIVERY

Browser notifications are available; Telegram, Discord, email, and mobile push need credentials/delivery infrastructure.

- Telegram News Alerts
- Discord News Alerts
- Email News Alerts
- Browser Notifications
- Mobile Notifications

## SMART EVENT DASHBOARD

Available from current calendar data; safety/volatility scores are descriptive, not advice.

- Events Today
- Events This Week
- Events This Month
- Highest Risk Event Today
- Highest Risk Event This Week
- Volatility Score
- Trading Safety Score

## MARKET CALENDAR

Economic calendar and trading sessions are available. Holidays/maintenance/gap risk need authoritative providers and broker schedules.

- US Holidays
- UK Holidays
- Global Market Holidays
- Banking Holidays
- Low Liquidity Warnings
- Weekend Gap Warnings
- Friday Close Risk Warnings
- Sunday Open Gap Warnings
- Broker Maintenance Alerts
- Session Open Alerts
- Session Close Alerts
- London Open Alerts
- New York Open Alerts
- London New York Overlap Alerts

## AI TRADING ASSISTANT

Local assistant and journal review are available; personalized coaching depends on local model and should be treated as informational.

- Daily Trading Review
- Weekly Review
- Monthly Review
- Trade Review
- Entry Analysis
- Exit Analysis
- Stop Loss Review
- Take Profit Review
- Mistake Detection
- Risk Assessment
- Drawdown Forecast
- Equity Forecast
- Personalized Suggestions
- Trading Habit Detection
- Psychological Bias Detection
- Performance Coaching
- AI Trading Mentor

## TRADE REPLAY SYSTEM

Historical candle playback, reconstruction, and bar-based MFE/MAE are implemented. Alternative exits/missed-opportunity analysis are not inferred.

- Replay Historical Trades
- Candle By Candle Playback
- Position Replay
- Trade Reconstruction
- Missed Opportunity Analysis
- Alternative Exit Analysis

## ALERT SYSTEM

Local browser alert preferences and existing risk alerts are available; VPS/broker disconnect and external channels require monitoring setup.

- Daily Profit Alerts
- Daily Loss Alerts
- Drawdown Alerts
- Margin Alerts
- Spread Alerts
- Slippage Alerts
- Trade Open Alerts
- Trade Close Alerts
- TP Alerts
- SL Alerts
- EA Failure Alerts
- Broker Disconnect Alerts
- VPS Failure Alerts
- Custom Alerts
- Telegram Alerts
- Discord Alerts
- Email Alerts
- Mobile Push Alerts

## SMART LOG CENTER

EA log viewer/search/filter is available; AI diagnoses and auto-fixes are not implemented.

- Log Search Engine
- Error Filters
- Warning Filters
- Trade Filters
- Strategy Filters
- Severity Badges
- Error Explanations
- AI Error Diagnosis
- Auto Fix Suggestions

## RISK MANAGEMENT

Position size calculator and monitoring are available. Automatic loss locks/order changes are disabled; correlations need data.

- Position Size Calculator
- Dynamic Risk Calculator
- Daily Loss Lock
- Weekly Loss Lock
- Monthly Loss Lock
- Equity Protection
- Exposure Monitoring
- Correlation Risk Detection
- Leverage Analysis
- Auto Risk Reduction
- Auto Trading Disable Rules

## INDIAN TAX INTELLIGENCE SUITE

Financial-year broker ledger and original-currency realized/open P/L export are implemented. Tax calculation/conversion is not provided.

- MT5 Trade Scanner
- Financial Year Tracking
- Realized Profit Tracking
- Unrealized Profit Tracking
- Commission Tracking
- Swap Tracking
- Broker Fee Tracking
- Currency Conversion Engine
- USD INR Historical Conversion
- Net Profit Computation
- Tax Liability Estimator

## INCOME TAX PORTAL ASSISTANT

Copy/export and filing limits guidance are available; no tax classification or portal filing/tax liability estimates.

- Tax Filing Dashboard
- Tax Entry Assistant
- Copy Values Button
- Tax Classification Helper
- Filing Checklist
- Gross Business Income
- Forex Trading Income
- Commodity Trading Income
- Total Expenses
- Net Taxable Income
- Taxable Profit
- Advance Tax Estimate
- Carry Forward Loss Value
- Business Turnover
- Presumptive Tax Reference
- Audit Threshold Indicators

## CA MODE

Traceable source ledger export with monthly/quarterly summaries is available; not audit-ready/certified.

- Chartered Accountant Dashboard
- CA Report Export
- Annual Summary
- Quarterly Summary
- Monthly Summary
- Full Ledger Export
- Audit Ready Reports
- Tax Summary Pack

## EXPENSE TRACKER

Browser-local categorized expenses and exports are available; receipt storage is limited to existing local app behavior.

- VPS Expenses
- TradingView Costs
- Internet Expenses
- Cloud Server Costs
- Monitor Purchases
- Laptop Purchases
- Prop Firm Fees
- Education Costs
- Miscellaneous Costs
- Receipt Storage

## AI TAX ASSISTANT

General local AI can explain user-provided material; no tax advice, portal-specific calculation, or filing automation.

- Tax Chatbot
- Tax Report Explanation
- Expense Eligibility Questions
- Filing Guidance
- Tax Terminology Explanation
- Tax Summary Interpretation
- Tax Error Detection
- Explain Which Field To Fill
- Explain Why Tax Is Calculated
- Explain Documents Required
- Explain Portal Values

## LOCAL LLM ENGINE

Existing local Ollama integration supports installed/configured models; air-gapped state depends on host configuration.

- Ollama Integration
- Llama Support
- Qwen Support
- DeepSeek Support
- Gemma Support
- Mistral Support
- Air Gapped Mode
- Offline AI Mode
- Private AI Mode

## LOCAL AI USES

Local assistant, analysis, and knowledge guide search are available; accuracy depends on selected model.

- Trading Analysis
- Tax Analysis
- Knowledge Search
- Report Generation
- Log Diagnosis
- Strategy Suggestions
- Question Answering Assistant

## ALGORITHM MARKETPLACE

Not active; requires hosted product catalog, authentication, payment, licensing, and secure delivery.

- Algo Store
- Premium Algorithms
- Free Algorithms
- Licensing System
- Subscription Plans
- Lifetime Licenses
- Product Updates
- Changelog System
- Demo Mode
- Trial Access
- Customer Portal
- License Verification
- Secure Downloads

## FUTURE ALGO SALES

Not active; requires marketplace and legal/commercial operations.

- Sell Custom Algorithms
- Sell AI Strategies
- Premium Signal Packages
- Algorithm Categories
- Customer Reviews
- Product Ratings
- Usage Analytics
- Marketplace Rankings
- Featured Algorithms

## REFERRAL SYSTEM

Not active; requires consented attribution, partner terms, and reward ledger.

- Broker Referral Tracking
- Referral Statistics
- Referral Rewards
- Referral Leaderboard
- Referral Link Manager
- Discount Rewards
- Loyalty Rewards

## DISCOUNT MODEL

Not active; tier rules require referral verification and billing integration.

- 1 Broker Signup = Tier 1 Discount
- 2 Broker Signups = Tier 2 Discount
- 3 Broker Signups = Tier 3 Discount
- VIP Referral Tier
- Lifetime Customer Rewards

## COMMUNITY HUB

Local link manager and knowledge center are available; publishing, membership, and announcements are external.

- Telegram Channel Block
- Discord Server Block
- WhatsApp Community Block
- YouTube Channel Block
- Documentation Portal
- Knowledge Center
- Community Announcements
- Event Calendar

## TRADING JOURNAL

Browser-local journal and exports are available; screenshot storage is constrained to local browser/app support.

- Personal Journal
- Screenshot Storage
- Trade Notes
- Lessons Learned
- Mistake Tracking
- Improvement Plans
- Daily Reflections

## KNOWLEDGE CENTER

Local searchable starter guides are available; academy/tutorial content is not yet populated.

- Trading Academy
- Tutorials
- Strategy Guides
- Market Guides
- Tax Education Center
- FAQ System

## AUTOMATION AGENTS

Not active; no remote agent orchestration or trading command plane.

- Research Agent
- News Agent
- Trading Agent
- Tax Agent
- Compliance Agent
- Portfolio Agent
- Risk Agent
- Reporting Agent

## INFRASTRUCTURE MONITORING

Local PC/MT5/Ollama/network/disk monitor is available. VPS, broker health, and execution latency need a remote monitoring agent.

- VPS Monitoring
- CPU Monitoring
- RAM Monitoring
- Storage Monitoring
- Internet Monitoring
- MT5 Monitoring
- Broker Health Monitoring
- Trade Execution Speed
- Latency Monitoring
- System Health Score

## UI & UX

Multipage desktop UI, dark/gold styling, movable/drawable live chart and responsive layout are available. Saved layouts/widget drag-drop are not implemented.

- Overview Tab
- Positions Tab
- Strategy Tab
- News Tab
- Analytics Tab
- Tax Tab
- Marketplace Tab
- AI Tab
- Community Tab
- Settings Tab
- Mobile Responsive Layout
- Desktop Layout
- Dark Theme
- Gold Theme
- Widget Customization
- Drag And Drop Panels
- Saved Layouts

## COMPLIANCE & LEGAL CENTER

Risk/educational disclosures and local data export/delete controls are available. Formal legal documents require qualified review.

- Risk Disclosure
- No Profit Guarantee Disclaimer
- No 100 Percent Accuracy Disclaimer
- Educational Content Disclaimer
- Not Financial Advice Disclaimer
- User Responsibility Agreement
- Liability Waiver
- Market Risk Warning
- Backtest Disclaimer
- Forward Test Disclaimer
- AI Analysis Disclaimer
- Broker Risk Disclaimer
- Tax Disclaimer
- Affiliate Disclosure
- Privacy Policy
- Terms And Conditions
- Data Processing Disclosure
- Cookie Policy
- Data Export Request
- Account Deletion Request

## REGULATORY DISCLOSURES

Registration status must be confirmed by the operator; app makes no registration claim.

- SEBI Registration Status Disclosure
- Non Registered Advisor Disclosure
- No Investment Management Declaration
- No Guaranteed Returns Declaration

## FUTURE EXPANSION BLOCKS

Listed as future integrations; no external services are represented as connected.

- Future Broker Integrations
- Future Premium EAs
- Future Partner Brokers
- Future Telegram Networks
- Future Discord Networks
- Future SaaS Products
- Future AI Agents
- Future Courses
- Future Franchises
- Future API Marketplace
- Future Copy Trading Network
- Future Mobile Apps

## ULTIMATE PLATFORM VISION

The app is an expanding local trading workspace; marketplace, tax filing, remote agents, and commercial platform services remain future work.

- MT5 Dashboard
- Risk Management System
- AI Trading Assistant
- Indian Tax Filing Assistant
- CA Reporting System
- News War Room
- Economic Intelligence Center
- Local LLM Hub
- Algo Marketplace
- Referral Business Platform
- Trading Journal
- Community Ecosystem
- Infrastructure Monitoring
- Compliance Center
- Automation Agent Platform
- Full Trading Operating System
