Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "venv\Scripts\pythonw.exe" & Chr(34) & " main.py", 0, False
