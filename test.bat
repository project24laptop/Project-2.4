@echo off

REM Attempt to stop process with PID 3192 using different methods

REM Method 1: Taskkill command
taskkill /PID 3192 /F

REM Method 2: WMIC command
wmic process where "ProcessId=3192" call terminate

REM Method 3: PowerShell command
powershell -Command "Stop-Process -Id 3192 -Force"

REM Method 4: PsKill utility (if available)
pskill 3192

REM Method 5: Send CTRL+C signal to process
echo. | set /p="Stopping process with PID 3192... "
powershell -Command "$p = Get-Process -Id 3192; $p.CloseMainWindow(); Start-Sleep -Seconds 5; if (-not $p.HasExited) { $p.Kill() }"
if errorlevel 1 (
  echo Failed to stop the process.
) else (
  echo Process stopped successfully.
)

pause
