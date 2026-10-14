# Security policy

## Supported versions

Security reports are accepted for the latest version on the `main` branch. Older snapshots may not receive fixes.

## Report a vulnerability privately

Please do not publish exploit details in a public issue. Use GitHub's **Report a vulnerability** action on this repository's **Security → Advisories** page to send a private report. If that action is unavailable, contact the repository owner through the GitHub profile before disclosing technical details. Do not include broker passwords, account numbers, real trade journals, or other people's data in a report.

Include the affected file/version, impact, reproducible steps or a minimal proof of concept, and any suggested mitigation. Allow reasonable time for investigation and a fix before public disclosure. There is no guaranteed response or remediation time.

## Security baseline

- Keep the dashboard bound to loopback; it has no login and is not designed for internet exposure.
- Never commit `.env` files, credentials, broker data, account exports, journals, screenshots, or machine logs.
- Report suspected secret exposure promptly so the owner can revoke/rotate the credential and remove it from repository history.
- AI output, financial data, and risk calculations require independent verification; this project is not an execution or custody service.
