# Install and run Xuzera on Windows

## 1. Requirements

- Windows 10 or 11, 64-bit.
- Python 3.10 or later. The launcher checks for its bundled Python runtime, then `py` or `python` on PATH.
- Internet access for initial package installation and online headlines.
- MetaTrader 5 desktop, signed in and receiving quotes, for broker account, position, and candle data.
- Optional: Ollama plus a locally downloaded model for AI analysis.

## 2. Download the project

1. Sign in to GitHub and open the Xuzera repository (for a private repository, your account needs access).
2. Choose **Code → Download ZIP**.
3. In File Explorer, right-click the ZIP and choose **Extract All**.
4. Extract to a normal folder you control, for example `C:\Users\<your-name>\Documents\Xuzera-Trading-OS`.
5. Do not launch from the ZIP preview, a temporary folder, or `Program Files`.

For updates, close Xuzera before replacing files. Back up any journal or report you want to keep first.

## 3. First launch

1. Open the extracted folder.
2. Double-click **Start Xuzera.bat**.
3. On first launch, the app installs `requirements.txt` into the local `vendor` directory. Let it finish; internet access is needed.
4. The launcher checks the optional news-service folder, opens MT5 if found in its default location, starts the local Xuzera server, and opens the browser.
5. Keep the launcher window open. If necessary, open **http://127.0.0.1:8766** yourself.
6. Close the launcher window to stop the local server.

The Windows `MetaTrader5` package communicates with an MT5 terminal on this same machine. The dashboard still opens if MT5 is missing, but broker-specific information will be unavailable.

## 4. Connect MT5 and EA source

1. Start MT5 and sign in to the account you intend to view.
2. Confirm the terminal receives broker quotes.
3. Start Xuzera and check **Connections** for MT5 status.
4. In MT5, open Navigator, right-click Expert Advisors, and choose Refresh.
5. To use the EA, open `mt5/GoldPriceActionEA.mq5` in MetaEditor, compile it, and attach it to a demo chart first. Read its inputs carefully. `EnableTrading` defaults to `false`.

Xuzera's dashboard is read-only; it does not submit, edit, or close trades. EA heartbeat views require the EA to be compiled and attached. Available candle and deal history is determined by the terminal and broker.

## 5. Chart controls

Open **Markets & chart**, select a broker-provided gold symbol and timeframe, and use drag to pan, the mouse wheel to zoom, and the drawing menu for horizontal lines, trendlines, and range boxes. Drawings are saved in that browser on that computer. The chart is visual analysis only.

## 6. Optional Ollama AI

1. Install Ollama from its official vendor source and start its local service.
2. Download an Ollama model that fits your computer's memory.
3. Use AI/System or the assistant in Xuzera.
4. Optional environment settings before launch: `OLLAMA_URL` (default `http://127.0.0.1:11434`) and `OLLAMA_MODEL`.

AI analysis can be inaccurate and does not control trading. If you set Ollama to a remote endpoint, the information sent to it leaves the computer.

## 7. News and calendar

The main app uses fallback public headline/calendar sources and requires internet for current data. Provider availability, event timing, values, and coverage can change; check timestamps and verify important releases from original providers.

The Market Pulse connector is optional and not included in this public repository. Xuzera skips its startup and uses fallback feeds. If you obtain the upstream project and its license permits your use, follow [its current setup instructions](https://github.com/srinivasBJ/Market-Pulse) and place the source under `services/Market-Pulse`; its backend/database have separate requirements and must be started separately. Read [the licensing notice](THIRD_PARTY_NOTICES.md) first.

## 8. Configuration and secret handling

For a custom MT5 journal or local AI endpoint, set environment variables before launch in a private PowerShell session or local launcher copy:

```powershell
$env:MT5_JOURNAL_PATH = 'C:\path\to\TradeJournal.csv'
$env:OLLAMA_URL = 'http://127.0.0.1:11434'
$env:OLLAMA_MODEL = 'qwen3:14b'
& ".\Start Xuzera.bat"
```

Never commit `.env` files, SMTP app passwords, Telegram tokens/chat IDs, Discord webhook URLs, broker credentials, account IDs, journals, or screenshots. Do not send secrets in chat. External notifications remain inactive until credentials and recipients are configured and tested.

## 9. Optional Git update

Install Git for Windows, then:

```powershell
git clone https://github.com/Vedhanth-P/Xuzera-Trading-OS.git
cd Xuzera-Trading-OS
& ".\Start Xuzera.bat"
```

To update, close Xuzera and run `git pull`. Back up local data before replacing files.

## 10. Troubleshooting

- **Python not found:** Install 64-bit Python 3.10+ and enable the PATH option, then reopen the terminal and launch again.
- **Dependency install fails:** Check internet access and retry. Or run `python -m pip install --target vendor -r requirements.txt` in the app folder.
- **Browser cannot connect:** Keep the launcher open, use `http://127.0.0.1:8766`, and close any older Xuzera window using the same port.
- **MT5 disconnected:** Sign into MT5, verify live quotes, then restart Xuzera.
- **No candle history:** Select the broker's symbol and timeframe and load history in MT5.
- **News service is absent:** This is optional; fallback public feeds are used. Check internet access and the provider status.
- **AI is unavailable:** Start Ollama and install a compatible local model.
- **Excel report is locked:** Close `Xuzera-TradingOS.xlsx` and restart Xuzera.

## 11. Local data

Excel reports are saved beside `app.py` as `Xuzera-TradingOS.xlsx`. Xuzera may read the MT5 journal path configured by the launcher. Local browser data, MT5 history, reports, and logs are not synchronized by a Xuzera cloud service. Back up files you want to retain before deleting or replacing the application folder.
