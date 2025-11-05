@echo off
title SmartDoc AI - Stopping All Services
color 0C

echo.
echo ========================================
echo    SmartDoc AI - Service Stopper
echo ========================================
echo.

echo Stopping all services...
echo.

echo [1/3] Stopping Frontend (Port 3000)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3000" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

echo [2/3] Stopping Backend (Port 3001)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3001" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

echo [3/3] Stopping AI Service (Port 8001)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8001" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

echo.
echo ========================================
echo    All Services Stopped!
echo ========================================
echo.
echo Press any key to exit...
pause >nul
