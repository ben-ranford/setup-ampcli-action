#!/bin/bash
set -euo pipefail

echo "🔍 Validating Amp CLI installation..."

validate_bun() {
    if ! command -v bun &> /dev/null; then
        echo "❌ Bun not found in PATH"
        return 1
    fi
    
    local version
    version=$(bun --version)
    echo "✅ Bun validation passed: v$version"
}

validate_amp() {
    if ! command -v amp &> /dev/null; then
        echo "❌ Amp CLI not found in PATH"
        return 1
    fi
    
    local version path
    version=$(amp --version 2>/dev/null || echo "unknown")
    path=$(which amp)
    
    echo "✅ Amp CLI validation passed: $version"
    echo "📍 Located at: $path"
    
    # Test basic functionality
    if amp --help &> /dev/null; then
        echo "✅ Amp CLI help command works"
    else
        echo "⚠️  Amp CLI help command failed"
    fi
}

validate_auth() {
    echo "🔑 Validating authentication setup..."
    
    if [[ -n "${Amp_API_KEY:-}" ]]; then
        echo "✅ Amp_API_KEY is set"
    else
        echo "⚠️  No API key configured"
    fi
}

validate_permissions() {
    echo "🔒 Checking file permissions..."
    
    local amp_path
    if amp_path=$(which amp 2>/dev/null); then
        if [[ -x "$amp_path" ]]; then
            echo "✅ Amp CLI is executable"
        else
            echo "❌ Amp CLI is not executable"
            return 1
        fi
    fi
}

main() {
    local exit_code=0
    
    validate_bun || exit_code=1
    validate_amp || exit_code=1
    validate_auth
    validate_permissions || exit_code=1
    
    if [[ $exit_code -eq 0 ]]; then
        echo "🎉 All validations passed!"
    else
        echo "❌ Some validations failed"
        exit 1
    fi
}

main "$@"