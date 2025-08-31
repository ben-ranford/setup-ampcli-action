#!/bin/bash
set -euo pipefail

VERSION="${1:-latest}"
BUN_VERSION="${2:-latest}"
PROMPT="${3:-}"

echo "🚀 Setting up Amp CLI with Bun..."
echo "Version: $VERSION"
echo "Bun Version: $BUN_VERSION"

install_bun() {
    if command -v bun &> /dev/null; then
        local current_version
        current_version=$(bun --version)
        echo "✅ Bun already installed: v$current_version"
        echo "bun-version=$current_version" >> "$GITHUB_OUTPUT"
        return 0
    fi

    echo "📦 Installing Bun..."
    if [[ "$BUN_VERSION" == "latest" ]]; then
        curl -fsSL https://bun.sh/install | bash
    else
        curl -fsSL https://bun.sh/install | bash -s "bun-v$BUN_VERSION"
    fi

    export PATH="$HOME/.bun/bin:$PATH"
    
    if command -v bun &> /dev/null; then
        local installed_version
        installed_version=$(bun --version)
        echo "✅ Bun installed successfully: v$installed_version"
        echo "bun-version=$installed_version" >> "$GITHUB_OUTPUT"
        
        # Add to PATH for subsequent steps
        echo "$HOME/.bun/bin" >> "$GITHUB_PATH"
    else
        echo "❌ Failed to install Bun"
        exit 1
    fi
}

install_amp() {
    echo "🔧 Installing Amp CLI..."
    
    if [[ "$VERSION" == "latest" ]]; then
        bun add -g @sourcegraph/amp
    else
        bun add -g "@sourcegraph/amp@$VERSION"
    fi

    # Verify installation
    if command -v amp &> /dev/null; then
        local installed_version
        installed_version=$(amp --version 2>/dev/null || echo "unknown")
        echo "✅ Amp CLI installed successfully: $installed_version"
        echo "amp-version=$installed_version" >> "$GITHUB_OUTPUT"
        echo "amp-path=$(which amp)" >> "$GITHUB_OUTPUT"
    else
        echo "❌ Amp CLI installation failed"
        exit 1
    fi
}

setup_auth() {
    echo "🔑 Setting up authentication..."
    
    if [[ -n "${Amp_API_KEY:-}" ]]; then
        export Amp_API_KEY
        echo "✅ Amp API key configured"
    else
        echo "⚠️  No Amp_API_KEY provided"
    fi
}

run_prompt() {
    if [[ -n "$PROMPT" ]]; then
        echo "💬 Running initial prompt..."
        echo "Prompt: $PROMPT"
        
        # Run the prompt with Amp CLI
        if amp "$PROMPT" > /dev/null 2>&1; then
            echo "✅ Initial prompt executed successfully"
        else
            echo "⚠️  Initial prompt execution failed (this may be expected if authentication is required)"
        fi
    else
        echo "ℹ️  No initial prompt provided"
    fi
}

main() {
    install_bun
    install_amp
    setup_auth
    run_prompt
    
    echo "🎉 Amp CLI setup completed successfully!"
}

main "$@"