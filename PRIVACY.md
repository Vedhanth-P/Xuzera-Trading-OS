# Privacy notice

Xuzera is a local desktop application. It is designed to bind to `127.0.0.1` and does not provide user accounts or a hosted Xuzera service.

## Data the app may read or store

- When MetaTrader 5 is connected, Xuzera reads the signed-in terminal's account metrics, positions, pending orders, candles, and available trade history for the local dashboard and reports.
- Xuzera may read an MT5 journal file and write a local Excel report beside the app. Browser-local journal notes, drawings, filters, and some alert thresholds remain in that browser profile.
- Ollama analysis is sent to the local Ollama endpoint configured on the computer. If you change that endpoint to a remote service, data sent for analysis will leave the computer.
- News and calendar requests go to the selected public provider/feed endpoints. Opening a news article takes you to its publisher.
- If you configure email, Telegram, Discord, or other delivery integrations, the selected event/account summary and recipient/channel data are transmitted to those providers. Those integrations must remain disabled until you have reviewed their settings and destinations.

## Storage, retention, and deletion

The app does not include a Xuzera cloud account or central database. Local reports, journals, logs, MT5 history, and browser data remain under the relevant app/terminal/browser storage paths until the user removes them. Back up important files before deleting or replacing folders. The source repository does not contain the author's trade journal, workbook, screenshots, logs, or credential files.

## Changes

This notice describes the packaged local application. Review the source and provider configuration before enabling any external data delivery. This notice is informational and is not a privacy guarantee for third-party providers.
