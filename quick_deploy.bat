@echo off
REM Quick setup for Railway.app or local testing
echo.
echo ========================================
echo   DXC Bot - Quick Deploy Setup
echo ========================================
echo.
echo This script will help you deploy to Railway.app
echo.
echo FIRST: Make sure you have:
echo   1. Discord bot token (regenerated)
echo   2. Discord server ID
echo   3. GitHub account (free at github.com)
echo.
pause

echo.
echo ========================================
echo   Step 1: Configure Git
echo ========================================
echo.
git config --global user.name "Bot Owner"
git config --global user.email "bot@example.com"

echo.
echo ========================================
echo   Step 2: Initialize Repository
echo ========================================
echo.
git init
git add .
git commit -m "DXC Bot Initial Deploy"

echo.
echo ========================================
echo   Step 3: GitHub Setup Instructions
echo ========================================
echo.
echo 1. Go to: https://github.com/new
echo 2. Name: dxc-bot
echo 3. Choose: Public
echo 4. Click: Create repository
echo 5. Copy the HTTPS URL (looks like: https://github.com/YOUR-NAME/dxc-bot.git)
echo 6. Come back here and paste it
echo.

set /p GITHUB_URL="Paste your GitHub HTTPS URL here: "

echo.
echo Pushing to GitHub...
git remote add origin %GITHUB_URL%
git branch -M main
git push -u origin main

echo.
echo ========================================
echo   SUCCESS! Next steps:
echo ========================================
echo.
echo 1. Go to: https://railway.app
echo 2. Click "Start a New Project"
echo 3. Choose "Deploy from GitHub repo"
echo 4. Select your dxc-bot repository
echo 5. Add these environment variables:
echo    - DISCORD_TOKEN = your_bot_token
echo    - ALLOWED_GUILD_ID = your_server_id
echo    - DB_PATH = database/bot.db
echo    - LAVALINK_URI = http://localhost:2333
echo    - LAVALINK_PASSWORD = youshallnotpass
echo 6. Deploy!
echo.
echo Your bot will be online in 2-5 minutes!
echo.
pause
