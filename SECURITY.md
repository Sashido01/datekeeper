# Security Policy

## Reporting a Vulnerability

We take the security of DateKeeper seriously. If you believe you have found a security vulnerability, please **do not** open a public issue. Instead, report it privately.

### How to report
- Send an email to **[security@datekeeper.app](mailto:security@datekeeper.app)** (замените на реальный email разработчика).
- Alternatively, use the **GitHub Private Vulnerability Reporting** feature: go to the repository's "Security" tab and click "Report a vulnerability".

Please include as much detail as possible:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### Response timeline
- You will receive an acknowledgment within 48 hours.
- We will investigate and provide an initial assessment within 5 business days.
- We will keep you informed of progress and the expected release date for a fix.
- Once fixed, we will credit you (unless you prefer to remain anonymous).

## Supported Versions

We currently support the latest stable release with security updates. Older versions may not receive fixes.

| Version | Supported          |
| ------- | ------------------ |
| 1.x     | :white_check_mark: |
| < 1.0   | :x:                |

## Security Measures

- All data is stored locally.
- No telemetry, no analytics.
- Encryption keys are stored in platform secure storage (Keychain/Keystore).
- AES-256 encryption for exported backups and sync files.
- Open source code for community review.