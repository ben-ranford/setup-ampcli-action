# Security Policy

## Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| v1.x    | ✅ Yes             |
| < v1.0  | ❌ No              |

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security issue, please follow these guidelines:

### For Sensitive Vulnerabilities

**Use private disclosure for high or critical severity issues:**

1. **GitHub Private Vulnerability Reporting** (Preferred)
   - Go to the [Security tab](https://github.com/ben-ranford/setup-ampcli-action/security) of this repository
   - Click "Report a vulnerability"
   - Fill out the form with details

2. **Direct Contact**
   - Email: [Create an issue](https://github.com/ben-ranford/setup-ampcli-action/issues) requesting contact information for security issues
   - Include "SECURITY" in the subject line
   - We'll provide secure communication channels

### For General Security Concerns

For non-sensitive security issues, you can:
- Use our [Security Issue Template](https://github.com/ben-ranford/setup-ampcli-action/issues/new?template=security.yml)
- Discuss in [GitHub Discussions](https://github.com/ben-ranford/setup-ampcli-action/discussions)

## What to Report

Please report any security concerns including:

- **Input validation issues** - Improper handling of user inputs
- **Code injection vulnerabilities** - Command injection, script injection
- **Authentication bypasses** - Issues with API key handling
- **Information disclosure** - Unintended exposure of sensitive data
- **Dependency vulnerabilities** - Security issues in dependencies (Bun, Amp CLI)
- **Privilege escalation** - Unintended elevation of permissions
- **Supply chain attacks** - Compromised dependencies or build process

## What NOT to Report

Please don't report:

- Issues with the Amp CLI itself (report to [Sourcegraph](https://sourcegraph.com/amp))
- Issues with Bun (report to [Bun repository](https://github.com/oven-sh/bun))
- General GitHub Actions platform issues
- Non-security related bugs (use regular issue templates)

## Response Timeline

We aim to:

- **Acknowledge** receipt within 48 hours
- **Provide** initial assessment within 7 days
- **Release** fixes for critical issues within 30 days
- **Release** fixes for non-critical issues within 90 days

## Security Measures

This action implements several security measures:

### Input Validation

- All user inputs are validated and sanitized
- Version strings are checked against expected patterns
- Environment variables are handled securely

### Minimal Permissions
- The action requests only necessary permissions
- No persistent credentials are stored
- Temporary credentials are cleaned up

### Dependency Management
- Dependencies are pinned to specific versions
- Regular security updates are applied
- Automated dependency scanning is enabled

### Code Review
- All changes require review before merging
- Security-focused code review for sensitive changes
- Automated security scanning on all commits

## Disclosure Policy

- We practice **responsible disclosure**
- Security issues will be publicly disclosed only after fixes are available
- We will credit researchers who report vulnerabilities (unless they prefer anonymity)
- Coordinated disclosure timeline will be agreed upon with the reporter

## Security Contact

For urgent security matters:
1. Use GitHub's private vulnerability reporting
2. Create a regular issue requesting security contact information
3. Check the repository for updated contact methods

Thank you for helping keep Setup Amp CLI Action secure! 🔒
