param(
    [string]$Version = "latest",
    [string]$BunVersion = "latest",
    [string]$Prompt = ""
)

$ErrorActionPreference = "Stop"

Write-Host "🚀 Setting up Amp CLI with Bun..." -ForegroundColor Green
Write-Host "Version: $Version"
Write-Host "Bun Version: $BunVersion"

function Install-Bun {
    if (Get-Command bun -ErrorAction SilentlyContinue) {
        $currentVersion = & bun --version
        Write-Host "✅ Bun already installed: v$currentVersion" -ForegroundColor Green
        Add-Content -Path $env:GITHUB_OUTPUT -Value "bun-version=$currentVersion"
        return
    }

    Write-Host "📦 Installing Bun..." -ForegroundColor Yellow
    
    try {
        if ($BunVersion -eq "latest") {
            Invoke-RestMethod -Uri https://bun.sh/install.ps1 | Invoke-Expression
        } else {
            $env:BUN_INSTALL_VERSION = $BunVersion
            Invoke-RestMethod -Uri https://bun.sh/install.ps1 | Invoke-Expression
        }

        # Add Bun to PATH
        $bunPath = "$env:USERPROFILE\.bun\bin"
        $env:PATH = "$bunPath;$env:PATH"
        Add-Content -Path $env:GITHUB_PATH -Value $bunPath

        if (Get-Command bun -ErrorAction SilentlyContinue) {
            $installedVersion = & bun --version
            Write-Host "✅ Bun installed successfully: v$installedVersion" -ForegroundColor Green
            Add-Content -Path $env:GITHUB_OUTPUT -Value "bun-version=$installedVersion"
        } else {
            throw "Bun command not found after installation"
        }
    }
    catch {
        Write-Host "❌ Failed to install Bun: $_" -ForegroundColor Red
        exit 1
    }
}

function Install-Amp {
    Write-Host "🔧 Installing Amp CLI..." -ForegroundColor Yellow
    
    try {
        if ($Version -eq "latest") {
            & bun add -g "@sourcegraph/amp"
        } else {
            & bun add -g "@sourcegraph/amp@$Version"
        }

        # Verify installation
        if (Get-Command amp -ErrorAction SilentlyContinue) {
            $installedVersion = & amp --version 2>$null
            if (-not $installedVersion) { $installedVersion = "unknown" }
            
            Write-Host "✅ Amp CLI installed successfully: $installedVersion" -ForegroundColor Green
            Add-Content -Path $env:GITHUB_OUTPUT -Value "amp-version=$installedVersion"
            
            $ampPath = (Get-Command amp).Source
            Add-Content -Path $env:GITHUB_OUTPUT -Value "amp-path=$ampPath"
        } else {
            throw "Amp CLI command not found after installation"
        }
    }
    catch {
        Write-Host "❌ Amp CLI installation failed: $_" -ForegroundColor Red
        exit 1
    }
}

function Setup-Auth {
    Write-Host "🔑 Setting up authentication..." -ForegroundColor Yellow
    
    if ($env:Amp_API_KEY) {
        Write-Host "✅ Amp API key configured" -ForegroundColor Green
    } else {
        Write-Host "⚠️  No Amp_API_KEY provided" -ForegroundColor Yellow
    }
}

function Invoke-Prompt {
    if ($Prompt -and $Prompt.Trim() -ne "") {
        Write-Host "💬 Running initial prompt..." -ForegroundColor Yellow
        Write-Host "Prompt: $Prompt" -ForegroundColor Cyan
        
        try {
            # Run the prompt with Amp CLI
            & amp $Prompt >$null 2>&1
            Write-Host "✅ Initial prompt executed successfully" -ForegroundColor Green
        }
        catch {
            Write-Host "⚠️  Initial prompt execution failed (this may be expected if authentication is required)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "ℹ️  No initial prompt provided" -ForegroundColor Gray
    }
}

try {
    Install-Bun
    Install-Amp
    Setup-Auth
    Invoke-Prompt
    
    Write-Host "🎉 Amp CLI setup completed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Setup failed: $_" -ForegroundColor Red
    exit 1
}