# Contributing to Setup Amp CLI Action

Thank you for your interest in contributing to the Setup Amp CLI Action! This document provides guidelines and information for contributors.

## 🚀 Quick Start

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create** a new branch for your feature/fix
4. **Make** your changes
5. **Test** your changes across platforms
6. **Submit** a pull request with your changes merged into **one** commit

## 📋 Types of Contributions

We welcome several types of contributions:

- 🐛 **Bug fixes** - Fix issues with the action
- ✨ **New features** - Add new functionality or inputs/outputs
- 📝 **Documentation** - Improve README, examples, or code comments
- 🔧 **Maintenance** - Dependency updates, CI improvements
- 🎨 **Code quality** - Refactoring, style improvements

## 🛠️ Development Setup

### Prerequisites

- Node.js 20+ (for development tools)
- Access to GitHub Actions runners (for testing)
- Basic knowledge of GitHub Actions, Shell scripting, and PowerShell

### Local Development

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/setup-ampcli-action.git
cd setup-ampcli-action

# Create a feature branch
git checkout -b feature/your-feature-name
```

## 🧪 Testing

### Testing Your Changes

1. **Create a test workflow** in a separate repository or fork
2. **Reference your branch** in the workflow:

   ```yaml
   - uses: YOUR_USERNAME/setup-ampcli-action@your-branch-name
   ```

3. **Test on multiple platforms**:
   - Ubuntu (ubuntu-latest)
   - macOS (macos-latest)
   - Windows (windows-latest)

### Test Cases to Verify

- [ ] Basic installation works
- [ ] Version pinning works correctly
- [ ] Cross-platform compatibility
- [ ] Error handling works as expected
- [ ] Authentication works properly
- [ ] Prompt ingestion works (if applicable)
- [ ] Output values are set correctly

## 📝 Pull Request Process

1. **Update documentation** if you've changed inputs/outputs or behavior
2. **Add examples** if you've added new features
3. **Test thoroughly** across platforms
4. **Fill out the PR template** completely
5. **Link related issues** using "Fixes #123" syntax

### PR Review Process

- Maintainers will review PRs within a few days
- Automated checks must pass (if configured)
- At least one maintainer approval is required
- Changes may be requested before merging

## 🐛 Reporting Issues

Use our issue templates for:

- **Bug reports** - Use the bug report template
- **Feature requests** - Use the feature request template
- **Questions** - Use the question template
- **Documentation issues** - Use the documentation template

### Before Reporting

- Search existing issues to avoid duplicates
- Test on the latest version
- Provide complete information (OS, versions, workflow config)

## 📋 Coding Standards

### Shell Scripts (`scripts/*.sh`)

- Use `#!/bin/bash` shebang
- Set `set -e` for error handling
- Quote variables: `"$variable"`
- Use meaningful variable names
- Add comments for complex logic

### PowerShell Scripts (`scripts/*.ps1`)

- Use PowerShell 5.1+ compatible syntax
- Set `$ErrorActionPreference = "Stop"`
- Use approved verbs for functions
- Add comment-based help for functions

### YAML Files

- Use 2-space indentation
- Quote string values when needed
- Keep lines under 100 characters
- Validate syntax before committing

## 🤝 Code of Conduct

### Our Standards

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Maintain a welcoming environment

### Not Acceptable

- Harassment or discrimination
- Personal attacks
- Spam or off-topic discussions
- Sharing private information

## 📞 Getting Help

- **Issues**: Use GitHub issues for bugs and feature requests
- **Discussions**: Use GitHub Discussions for general questions
- **Documentation**: Check the README for usage examples

## 🙏 Recognition

Contributors will be recognized in:

- Release notes for significant contributions
- GitHub's contributor graph
- Appreciation in relevant issues/PRs

Thank you for contributing to the setup Amp CLI Action! 🎉
