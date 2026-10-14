# Xuzera Trading OS

A local-first, multipage MetaTrader 5 dashboard with account and position views, a movable and drawable live XAUUSD chart, news and economic-calendar pages, analytics, journaling, local AI, and reports.

![Xuzera brand](Xuzera-logo.jpg)

> **Trading risk:** This application is for informational purposes only and does not constitute financial advice. Trading can lead to substantial losses. The dashboard and AI do not guarantee results and do not place or manage orders. The included EA starts with trading disabled; inspect and demo-test it before use.

## Download and run

1. Download the repository ZIP from **Code → Download ZIP** and extract it to a normal folder.
2. Install Python 3.10+ and MetaTrader 5 desktop if broker data is needed.
3. Double-click `Start Xuzera.bat` and allow it to install Python requirements.
4. Keep its console open and open `http://127.0.0.1:8766`.
5. See [INSTALLATION.md](INSTALLATION.md) for detailed setup, MT5/EA use, Ollama, news, troubleshooting, and updates.

## Main pages

- Overview and account status
- Positions, pending orders, margin, and risk views
- Live gold chart with pan, zoom, and saved drawings
- News War Room and economic calendar
- Analytics, trade journal, expenses, and tax records
- Local Ollama AI analysis and assistant
- EA status/logs, connections, and automation controls

[FEATURE_COVERAGE.md](FEATURE_COVERAGE.md) distinguishes available, limited, and unavailable features. [TRADING_OS_ROADMAP.md](TRADING_OS_ROADMAP.md) lists future work. A visible setting or feature name does not mean an external integration is configured or active.

## Data and service limits

MT5 account/chart data depends on a connected Windows terminal and broker history. News and calendar values depend on public providers and internet access; verify major releases with their originating sources. Ollama and a downloaded local model are optional. Email/Telegram/Discord delivery and automated EA controls require additional secure setup and remain disabled unless configured.

The application binds to `127.0.0.1`; it has no login and must not be exposed to a public network. Read [SECURITY.md](SECURITY.md) and [PRIVACY.md](PRIVACY.md).

The optional Market Pulse API source is not bundled because the upstream source checkout did not include a license. Xuzera uses its existing fallback feeds if the service is absent. See [services/Market-Pulse/README.md](services/Market-Pulse/README.md) and [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Licensing and policies

Xuzera application files are licensed under [MIT](LICENSE), unless a file or third-party component states otherwise. The license does not apply to MetaTrader software/packages, Market Pulse, data-provider content, or other third-party services. See [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Included source

- `app.py` — local Python server, MT5 integration, APIs, and Excel reports
- `dashboard.html` — multipage dashboard and interactive chart
- `mt5/GoldPriceActionEA.mq5` — editable EA source
- `Start Xuzera.bat` — Windows launcher
- `FEATURE_COVERAGE.md`, `INSTALLATION.md`, and policies — feature status and operating guidance

This repository excludes personal journals, broker/account exports, generated workbooks, screenshots, logs, backups, compiled EA binaries, credentials, and local dependency folders. Generated reports use the name `Xuzera-TradingOS.xlsx`.
