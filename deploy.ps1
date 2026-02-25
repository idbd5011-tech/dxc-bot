# DXC Official Bot - Windows Deployment Script
# PowerShell script for setting up the bot on Windows Server

# Requires: Windows 10/Server 2019+, PowerShell 5.0+
# Run as Administrator

Write-Host "=== DXC Bot Deployment Setup (Windows) ===" -ForegroundColor Cyan

# Check if running as administrator
$currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "❌ Please run this script as Administrator!" -ForegroundColor Red
    exit 1
}

# Step 1: Check Python installation
Write-Host "🐍 Checking Python installation..." -ForegroundColor Yellow
$pythonVersion = python --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "📥 Download Python 3.11+ from https://www.python.org/downloads/" -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Found: $pythonVersion" -ForegroundColor Green

# Step 2: Get bot directory
$botDir = (Get-Item -Path $PSScriptRoot).FullName
Write-Host "📁 Bot directory: $botDir" -ForegroundColor Cyan

# Step 3: Create virtual environment
Write-Host "🔨 Creating Python virtual environment..." -ForegroundColor Yellow
$venvPath = Join-Path $botDir "venv"
if (Test-Path $venvPath) {
    Write-Host "Virtual environment already exists, skipping..."
} else {
    python -m venv $venvPath
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Virtual environment created" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to create virtual environment" -ForegroundColor Red
        exit 1
    }
}

# Step 4: Activate virtual environment
Write-Host "🔗 Activating virtual environment..." -ForegroundColor Yellow
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
& $activateScript

# Step 5: Install requirements
Write-Host "📦 Installing Python packages..." -ForegroundColor Yellow
pip install --upgrade pip setuptools wheel
$reqFile = Join-Path $botDir "requirements.txt"
if (Test-Path $reqFile) {
    pip install -r $reqFile
    Write-Host "✅ Dependencies installed" -ForegroundColor Green
} else {
    Write-Host "❌ requirements.txt not found" -ForegroundColor Red
    exit 1
}

# Step 6: Check/Create .env file
Write-Host "⚙️ Checking .env configuration..." -ForegroundColor Yellow
$envFile = Join-Path $botDir ".env"
if (-not (Test-Path $envFile)) {
    Write-Host "Creating .env file..." -ForegroundColor Yellow
    @"
DISCORD_TOKEN=your_bot_token_here
ALLOWED_GUILD_ID=your_guild_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
"@ | Out-File -FilePath $envFile -Encoding UTF8
    Write-Host "⚠️ Please edit $envFile with your bot credentials!" -ForegroundColor Yellow
}

# Step 7: Create autorun batch file
Write-Host "🚀 Creating autorun batch file..." -ForegroundColor Yellow
$batchPath = Join-Path $botDir "run_bot.bat"
$pythonPath = Join-Path $venvPath "Scripts\python.exe"
$mainPath = Join-Path $botDir "main.py"

@"
@echo off
cd /d "$botDir"
"$pythonPath" "$mainPath"
pause
"@ | Out-File -FilePath $batchPath -Encoding ASCII

Write-Host "✅ Batch file created: $batchPath" -ForegroundColor Green

# Step 8: Create Task Scheduler entry (optional)
$createTask = Read-Host "Create Windows Task Scheduler entry for auto-start? (y/n)"
if ($createTask -eq 'y' -or $createTask -eq 'Y') {
    Write-Host "📋 Creating scheduled task..." -ForegroundColor Yellow
    
    $taskName = "DXC-Bot"
    $taskPath = "\DXC\"
    
    # Remove existing task if present
    $existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
    if ($existingTask) {
        Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
        Write-Host "Removed existing task"
    }
    
    # Create new task
    $action = New-ScheduledTaskAction -Execute $pythonPath -Argument $mainPath -WorkingDirectory $botDir
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Restart -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3
    
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -RunLevel Highest -Force
    
    Write-Host "✅ Task Scheduler entry created" -ForegroundColor Green
}

# Done
Write-Host ""
Write-Host "=== Setup Complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Edit your bot token: notepad $envFile" -ForegroundColor White
Write-Host "2. Test the bot: & '$batchPath'" -ForegroundColor White
Write-Host "3. Or use the run_bot.vbs file for background execution" -ForegroundColor White
Write-Host ""
Write-Host "For automatic startup:" -ForegroundColor Yellow
Write-Host "- The bot will auto-start if you selected Task Scheduler option" -ForegroundColor White
Write-Host "- Or manually add the script to Startup folder" -ForegroundColor White
