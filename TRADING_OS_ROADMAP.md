# Trading OS roadmap

This file turns the consolidated 364-item list into an implementable roadmap for the existing local Xuzera. Items below are plans unless marked available in the dashboard; a heading in this file is not evidence that a service, integration, alert, or legal review exists.

## Available now

- Bookmarkable multi-page local application: Overview, Positions, Markets/Chart, News War Room, Analytics, Journal, Expenses/Tax Records, AI/System, and Connections. A private browser-local journal supports trade notes, daily reflections, lessons learned, mistake reviews, improvement plans, search/filter, deletion, and CSV export. Connections page reports actual MT5, calendar, news, Ollama, and browser-notification status.
- Read-only MetaTrader 5 account, position, pending-order, history, gold-candle, EA heartbeat, and expert-log views.
- Trade journal, filtering and CSV export, Excel reports, realized P/L summaries, basic win rate/profit factor/drawdown, and local Ollama analysis/chat.
- News headlines with cautious keyword context, Forex Factory calendar/news links, and indicative session clocks.
- Responsive dark/gold interface, browser-local on-screen loss/margin/drawdown alerts, a browser-local expense ledger with CSV export, and a read-only, broker-calculated gold position-size estimator, plus a two-second MT5 candle chart with pan/zoom and browser-saved horizontal-line, trendline, and range-box drawings, live stop/target distance and broker-estimated remaining position risk/reward, position age, expanded win/loss and streak metrics, and local-time weekday/hour/symbol breakdowns. It uses MT5 profit calculations and volume steps, refuses sizes below the broker minimum when the risk budget is too small, and excludes costs and execution differences. Order execution stays in the EA; the dashboard and AI do not submit or manage orders.

## Recommended delivery sequence

### 1. Safety and data foundations

- Define explicit data provenance, timestamp/timezone, account currency, missing-data and stale-data states for every metric. Extend local alerts with alert history and configurable persistence only after multi-browser behavior is designed.
- Add configurable read-only alert rules and notification history. Keep order pause/disable actions out of scope until a separately reviewed, fail-safe control path exists.
- Extend the position-size estimator with independently checked broker examples, explicit margin estimates, and configurable cost assumptions before relying on it for live decisions. Never infer a safe lot size from price distance alone.
- Add backups, restore, data export/deletion controls, access boundaries, and a clear local data inventory before any remote or multi-user feature.

### 2. Analytics and journal

- Improve balance/equity/drawdown curves using timestamped account samples; extend the chart with crosshair, editable drawings, alerts anchored to prices, and deeper historical retrieval beyond the 600-candle window; add duration, streaks, symbol/session breakdowns, excursions, and trade-quality fields only where source data supports them.
- Add replay and review workflows from stored market candles and position history, clearly marking unavailable or reconstructed values.
- Add strategy/EA comparisons, risk-adjusted ratios, correlation, and walk-forward tools after the dataset and sample-size assumptions are documented.

### 3. Tax and reporting (India)

- Extend the local expense ledger with account-backed realized/unrealized P/L, fees, swaps, currency-conversion source/date, and actual receipt storage. Keep source rows traceable.
- Generate accountant-friendly summaries and exports with traceable source rows and user corrections.
- Keep tax estimates, classification, thresholds, presumptive references, and filing guidance disabled until reviewed against the applicable financial year and by a qualified Indian tax professional. Do not present estimates as filing advice.

### 4. Local AI and knowledge

- Add source-linked local knowledge search, report templates, and log diagnosis with an explicit private/offline status.
- Keep AI outputs advisory, show the data snapshot/time used, and never let an agent place trades, change risk settings, or file taxes.

### 5. External products and ecosystem

- Treat marketplace, licensing, payments, subscriptions, referrals, community, mobile push, cloud sync, and multi-user accounts as separate products requiring authentication, authorization, secure delivery, billing, privacy terms, abuse controls, and operational support.
- Add broker, Telegram, Discord, email, and mobile integrations only after credentials are stored securely and delivery failures can be monitored.
- Add infrastructure monitoring only with an installed agent or supported host API; a local dashboard cannot observe an unrelated VPS by itself.

## Required disclosures and operating limits

- Trading and leveraged products involve substantial risk; losses can exceed expectations. Historical or backtest results do not predict future results. No profit or accuracy is guaranteed.
- The dashboard, forecasts, news labels, and AI are informational and educational, not financial/investment advice or an offer, recommendation, or managed service. Users make and verify their own decisions.
- Tax figures are estimates for discussion with a qualified professional, not tax or legal advice. Rules and eligibility depend on facts and the applicable year.
- Current app is local-only and has no user authentication. Do not expose it to the internet or share its port. The app currently has no privacy policy, terms, cookie system, account deletion workflow, registered-advisor status verification, or formal legal review; add those before onboarding other users or monetizing it.

## Release gates

1. Keep MT5 integration read-only and verify stale/disconnected states remain visible.
2. Validate financial calculations with broker-specific fixtures and independent manual examples before relying on them.
3. Keep credentials out of source files and logs; document local storage and retention.
4. Complete security, privacy, tax, financial-regulatory, and marketplace legal review before external access, advice-like services, payments, referrals, or user-generated products.
