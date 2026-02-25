@echo off
echo Stopping all running instances of the bot...
taskkill /F /IM pythonw.exe /T
taskkill /F /IM python.exe /T
echo Bot stopped successfully.
pause
