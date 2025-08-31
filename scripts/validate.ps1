$ErrorActionPreference = "Stop"

Write-Host "🔍 Validating Amp CLI installation..." -ForegroundColor Green

function Test-Bun {
    if (-not (Get-Command bun -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Bun not found in PATH" -ForegroundColor Red
        return $false
    }
    
    $version = & bun --version
    Write-Host "✅ Bun validation passed: v$version" -ForegroundColor Green
    return $true
}

function Test-Amp {
    if (-not (Get-Command amp -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Amp CLI not found in PATH" -ForegroundColor Red
        return $false
    }
    
    try {
        $version = & amp --version 2>$null
        if (-not $version) { $version = "unknown" }
        
        $path = (Get-Command amp).Source
        
        Write-Host "✅ Amp CLI validation passed: $version" -ForegroundColor Green
        Write-Host "📍 Located at: $path" -ForegroundColor Cyan
        
        # Test basic functionality
        try {
            & amp --help >$null 2>&1
            Write-Host "✅ Amp CLI help command works" -ForegroundColor Green
        }
        catch {
            Write-Host "⚠️  Amp CLI help command failed" -ForegroundColor Yellow
        }
        
        return $true
    }
    catch {
        Write-Host "❌ Amp CLI validation failed: $_" -ForegroundColor Red
        return $false
    }
}

function Test-Auth {
    Write-Host "🔑 Validating authentication setup..." -ForegroundColor Yellow
    
    if ($env:Amp_API_KEY) {
        Write-Host "✅ Amp_API_KEY is set" -ForegroundColor Green
    } else {
        Write-Host "⚠️  No API key configured" -ForegroundColor Yellow
    }
}

function Test-Permissions {
    Write-Host "🔒 Checking file permissions..." -ForegroundColor Yellow
    
    try {
        $ampCommand = Get-Command amp -ErrorAction SilentlyContinue
        if ($ampCommand) {
            Write-Host "✅ Amp CLI is accessible" -ForegroundColor Green
            return $true
        } else {
            Write-Host "❌ Amp CLI is not accessible" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "❌ Permission check failed: $_" -ForegroundColor Red
        return $false
    }
}

try {
    $allPassed = $true
    
    if (-not (Test-Bun)) { $allPassed = $false }
    if (-not (Test-Amp)) { $allPassed = $false }
    Test-Auth
    if (-not (Test-Permissions)) { $allPassed = $false }
    
    if ($allPassed) {
        Write-Host "🎉 All validations passed!" -ForegroundColor Green
    } else {
        Write-Host "❌ Some validations failed" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "❌ Validation failed: $_" -ForegroundColor Red
    exit 1
}