@echo off
setlocal
cd /d "%~dp0"
title Xuzera Trading OS
set "PORT=8766"
set "MARKET_PULSE_API_BASE=http://127.0.0.1:8000/api/v1"
set "MT5_JOURNAL_PATH=%APPDATA%\MetaQuotes\Terminal\Common\Files\TradeJournal.csv"

set "PYEXE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
set "PYARGS="
if exist "%PYEXE%" goto python_ready
where py >nul 2>nul
if not errorlevel 1 (set "PYEXE=py"&set "PYARGS=-3"&goto python_ready)
where python >nul 2>nul
if not errorlevel 1 (set "PYEXE=python"&goto python_ready)
echo Python 3 was not found. Install Python 3.10 or newer and try again.
pause
exit /b 1

:python_ready

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start Market Pulse.ps1"
if errorlevel 1 echo Market Pulse is unavailable; the dashboard will use its existing news feeds.

"%PYEXE%" %PYARGS% -c "import sys;sys.path.insert(0,'vendor');import openpyxl,MetaTrader5" >nul 2>nul
if errorlevel 1 (
  echo Installing required Python packages into the application folder...
  "%PYEXE%" %PYARGS% -m pip install --target vendor -r requirements.txt
  if errorlevel 1 (
    echo Dependency installation failed. Check your internet connection or install requirements.txt manually.
    pause
    exit /b 1
  )
)

for /f "delims=" %%D in ('powershell -NoProfile -Command "Get-ChildItem -LiteralPath (Join-Path $env:APPDATA 'MetaQuotes\Terminal') -Directory | Where-Object { Test-Path (Join-Path $_.FullName 'MQL5\Experts') } | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName"') do set "MT5DATA=%%D"
if defined MT5DATA (
  if not exist "%MT5DATA%\MQL5\Experts\GoldTradingControlCenter" mkdir "%MT5DATA%\MQL5\Experts\GoldTradingControlCenter"
  copy /Y "%~dp0mt5\GoldPriceActionEA.mq5" "%MT5DATA%\MQL5\Experts\GoldTradingControlCenter\" >nul
  if exist "%~dp0mt5\GoldPriceActionEA.ex5" copy /Y "%~dp0mt5\GoldPriceActionEA.ex5" "%MT5DATA%\MQL5\Experts\GoldTradingControlCenter\" >nul
)

if not exist "%ProgramFiles%\MetaTrader 5\terminal64.exe" goto no_terminal
tasklist /FI "IMAGENAME eq terminal64.exe" /FO CSV /NH | find /I "terminal64.exe" >nul
if errorlevel 1 start "MetaTrader 5" "%ProgramFiles%\MetaTrader 5\terminal64.exe"
:no_terminal
start "Xuzera Trading OS" http://127.0.0.1:%PORT%
echo Starting the local service. Keep this window open while using the dashboard.
"%PYEXE%" %PYARGS% app.py
if errorlevel 1 (
  echo The Python service stopped with an error shown above. If it says the port is in use, close the other dashboard window and retry.
  pause
)
endlocal

