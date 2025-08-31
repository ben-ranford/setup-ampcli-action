# Setup Amp CLI Action

A GitHub Action to install and configure [Sourcegraph's Amp CLI](https://sourcegraph.com/amp) using the Bun package manager.

## Features

- 🚀 **Lightning Fast**: Uses a modern package manager for installation to reduce windup
- 🌍 **Cross-Platform**: Supports Ubuntu, macOS, and Windows runners
- ✅ **Validation**: Comprehensive post-installation validation
- 🔧 **Version Pinning**: Install specific versions or latest
- 💬 **Prompt Ingestion**: Pipe in your initial commands

## Quick Start

```yaml
- name: Setup Amp CLI
  uses: ben-ranford/setup-ampcli-action@v1
  with:
    amp-api-key: ${{ secrets.Amp_API_KEY }}
```

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `version` | Amp CLI version to install | No | `latest` |
| `bun-version` | Bun version to install if not present | No | `latest` |
| `amp-api-key` | Amp API key for authentication | No | - |
| `prompt` | Initial prompt to send to Amp CLI after setup | No | - |

## Outputs

| Output | Description |
|--------|-------------|
| `amp-version` | Installed Amp CLI version |
| `amp-path` | Path to Amp CLI executable |
| `bun-version` | Installed Bun version |

## Usage Examples

### Basic Usage

```yaml
name: CI with Amp CLI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Amp CLI
        uses: ben-ranford/setup-ampcli-action@v1
        with:
          amp-api-key: ${{ secrets.Amp_API_KEY }}
      
      - name: Use Amp CLI
        run: amp --help
```

### Version Pinning

```yaml
- name: Setup Specific Amp Version
  uses: ben-ranford/setup-ampcli-action@v1
  with:
    version: '1.2.3'
    bun-version: '1.0.0'
```

### Prompt Ingestion

```yaml
- name: Setup Amp CLI with Initial Prompt
  uses: ben-ranford/setup-ampcli-action@v1
  with:
    amp-api-key: ${{ secrets.Amp_API_KEY }}
    prompt: 'help'
```

### Multi-Platform Matrix

```yaml
name: Cross-Platform Test
on: [push]

jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Amp CLI
        uses: ben-ranford/setup-ampcli-action@v1
        with:
          amp-api-key: ${{ secrets.Amp_API_KEY }}
      
      - name: Verify Installation
        run: |
          amp --version
          bun --version
```

## Authentication

- Requires `Amp_API_KEY` set via the `amp-api-key` input

## Prompt Ingestion

The `prompt` input allows you to automatically run an initial command with Amp CLI after setup. This is useful for running specific commands as part of your CI/CD pipeline

```yaml
- name: Setup and Test Amp CLI
  uses: ben-ranford/setup-ampcli-action@v1
  with:
    amp-api-key: ${{ secrets.Amp_API_KEY }}
    prompt: 'version'
```

**Note**: If authentication fails or the prompt requires interactive input, the action will continue but log a warning.

## Requirements

- GitHub Actions runner (Ubuntu, macOS, or Windows)
- Internet access for downloading Bun and Amp CLI
- Valid Amp API key

## Troubleshooting

### Installation Fails
1. Check runner has internet access
2. Verify API keys are correctly set in secrets
3. Try with `version: 'latest'` if using specific version

### Permission Issues
- On self-hosted runners, ensure user has permission to install global Bun packages
- Check that `~/.bun/bin` is in PATH after installation

### Corporate Networks
- Action supports proxy environments through standard environment variables
- Bun installation respects `HTTP_PROXY` and `HTTPS_PROXY`

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

For bugs and feature requests, please [open an issue](https://github.com/ben-ranford/setup-ampcli-action/issues).