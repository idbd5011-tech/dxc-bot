@echo off
REM DXC Official Bot - Startup Script
REM This script runs the bot with proper environment setup

setlocal enabledelayedexpansion

cd /d "%~dp0"

REM Check if virtual environment exists
if not exist "venv\Scripts\python.exe" (
    echo.
    echo ========================================
    echo Virtual Environment Not Found!
    echo ========================================
    echo.
    echo Creating virtual environment...
    python -m venv venv
    
    if !errorlevel! neq 0 (
        echo ERROR: Failed to create virtual environment
        echo Make sure Python 3.11+ is installed and in your PATH
        pause
        exit /b 1
    )
    
    echo.
    echo Installing dependencies...
    call venv\Scripts\pip.exe install -r requirements.txt
)

REM Check if .env exists
if not exist ".env" (
    echo.
    echo ========================================
    echo Configuration Missing!
    echo ========================================
    echo.
    echo Creating .env file with template...
    (
        echo DISCORD_TOKEN=your_bot_token_here
        echo ALLOWED_GUILD_ID=your_guild_id_here
        echo DB_PATH=database/bot.db
        echo LAVALINK_URI=http://localhost:2333
        echo LAVALINK_PASSWORD=youshallnotpass
    ) > .env
    
    echo.
    echo PLEASE EDIT THE .env FILE WITH YOUR BOT CREDENTIALS
    echo Press any key to open .env in Notepad...
    pause
    notepad .env
)

REM Run the bot
echo.
echo ========================================
echo Starting DXC Official Bot...
echo ========================================
echo.

call venv\Scripts\python.exe main.py

if !errorlevel! neq 0 (
    echo.
    echo ERROR: Bot crashed!
    echo Press any key to view details...
    pause
)
