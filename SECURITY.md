# Security Policy

CopyPasteWallet may store sensitive clipboard content. Security and privacy issues
are treated as a priority, especially issues that could expose saved content,
write sensitive values to logs, or allow another process to access application
data unexpectedly.

## Supported versions

CopyPasteWallet is currently in pre-release development and does not yet publish
stable versions.

| Version | Supported |
| --- | --- |
| Latest revision on `main` | Yes |
| Development branches, including `develop` | Best effort |
| Older revisions and forks | No |

Please reproduce an issue against the latest revision on `main` before reporting
it when possible.

## Reporting a vulnerability

Do not report security vulnerabilities in a public GitHub issue, discussion,
pull request, or other public channel.

Report vulnerabilities privately using
[GitHub Security Advisories](https://github.com/dharam4/CopyPasteWallet/security/advisories/new).

Include as much of the following information as possible:

- A clear description of the vulnerability and its potential impact
- The affected revision, macOS version, and Xcode version
- Reproduction steps or a minimal proof of concept
- Relevant logs, screenshots, or crash reports with sensitive content removed
- Any suggested mitigation or fix
- Whether the vulnerability has been disclosed elsewhere

Do not include real passwords, private keys, payment details, personal data, or
other sensitive clipboard content in the report. Use synthetic test data instead.

## What to expect

- The report will be acknowledged within three business days when possible.
- The maintainer will investigate, assess severity, and provide status updates.
- Confirmed vulnerabilities will be addressed according to their severity and
  the project's development capacity.
- Public disclosure should be coordinated with the maintainer and delayed until
  a fix or reasonable mitigation is available.

If a report is not accepted as a vulnerability, an explanation will be provided.
Good-faith reports and responsible testing are appreciated.

## Safe testing

Keep security research limited to systems and data you own or are explicitly
authorized to test. Avoid privacy violations, data destruction, service
disruption, social engineering, and accessing another person's clipboard or
saved content.
