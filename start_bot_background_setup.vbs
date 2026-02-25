' DXC Official Bot - Background Startup Script
' This runs the bot without showing a console window
' Usage: Double-click this file to start bot in background

Set objFSO = CreateObject("Scripting.FileSystemObject")
strScriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Check if virtual environment exists
If Not objFSO.FileExists(strScriptDir & "\venv\Scripts\python.exe") Then
    MsgBox "Virtual environment not found. Please run run_bot.bat first to set up the bot.", vbExclamation, "DXC Bot Setup Required"
    WScript.Quit
End If

' Check if .env exists
If Not objFSO.FileExists(strScriptDir & "\.env") Then
    MsgBox ".env file not found. Please run run_bot.bat first to configure the bot.", vbExclamation, "DXC Bot Configuration Required"
    WScript.Quit
End If

' Run bot in background
Set objShell = CreateObject("WScript.Shell")
strCommand = strScriptDir & "\venv\Scripts\python.exe " & strScriptDir & "\main.py"

' Create a hidden console window
On Error Resume Next
Set objProc = objShell.Exec(strCommand)
On Error GoTo 0

If Err.Number <> 0 Then
    MsgBox "Failed to start bot: " & Err.Description, vbCritical, "DXC Bot Error"
    WScript.Quit 1
End If

' Confirm startup
MsgBox "DXC Bot is starting in the background. Check your Discord server!", vbInformation, "DXC Bot Started"
