# Contributing to Xuzera

Thanks for considering a contribution.

## Before opening a change

- Read `SECURITY.md`, `PRIVACY.md`, and `FEATURE_COVERAGE.md`.
- For a substantial feature, open an issue first so its scope and data requirements can be discussed.
- Keep the dashboard local-only unless authentication and network access are designed and reviewed together.
- Do not add order execution, account controls, AI-driven trade actions, or secret handling without a separate threat model and explicit safety review.

## Prepare a contribution

1. Fork the repository and create a focused branch.
2. Make the smallest complete change and describe the behavior in plain language.
3. Never use real account data, credentials, personal logs, or screenshots in examples, tests, or commits. Use synthetic data.
4. Update `FEATURE_COVERAGE.md`, `INSTALLATION.md`, and `PRIVACY.md` when behavior or data handling changes.
5. Run syntax checks and manually verify the affected UI with MT5 disconnected and, where practical, connected to a demo terminal.
6. Open a pull request with a summary, verification steps, limitations, and screenshots only if they contain no personal/account data.

## Conduct

Participation follows `CODE_OF_CONDUCT.md`. By contributing, you agree that contributions you submit are licensed under the repository's MIT License, to the extent you have the right to do so. Third-party code and assets retain their own terms.
