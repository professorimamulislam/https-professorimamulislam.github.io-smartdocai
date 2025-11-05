@echo off
title SmartDoc AI - Fix Common Issues
color 0E

echo.
echo ========================================
echo    SmartDoc AI - Issue Fixer
echo ========================================
echo.

echo This script will help fix common issues:
echo 1. Stop all services
echo 2. Clear port conflicts
echo 3. Clean cache
echo 4. Restart services
echo.

pause

echo.
echo [1/5] Stopping all services...
echo.

echo Killing processes on port 3000...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3000" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

echo Killing processes on port 3001...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3001" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

echo Killing processes on port 8001...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8001" ^| find "LISTENING"') do taskkill /F /PID %%a 2>nul

timeout /t 2 >nul

echo.
echo [2/5] Cleaning Next.js cache...
if exist ".next" (
    rmdir /s /q .next 2>nul
    echo [OK] .next directory removed
) else (
    echo [INFO] No .next directory found
)

echo.
echo [3/5] Cleaning Python cache...
if exist "backend\__pycache__" (
    rmdir /s /q backend\__pycache__ 2>nul
    echo [OK] Python cache removed
) else (
    echo [INFO] No Python cache found
)

echo.
echo [4/5] Verifying installations...
echo.

echo Checking npm packages...
if not exist "node_modules\" (
    echo [WARNING] node_modules not found
    echo [ACTION] Installing npm packages...
    call npm install
) else (
    echo [OK] node_modules exists
)

echo.
echo [5/5] Starting fresh services...
echo.

echo Starting Backend...
start "Backend Server" cmd /k "cd backend && node server.js"
timeout /t 3 >nul

echo Starting AI Service...
start "AI Service" cmd /k "cd backend && python ai_service.py"
timeout /t 3 >nul

echo Starting Frontend...
start "Frontend" cmd /k "npm run dev"
timeout /t 5 >nul

echo.
echo ========================================
echo    Fix Complete!
echo ========================================
echo.

echo All services should be starting...
echo Wait 10-15 seconds, then:
echo - Open index.html to check status
echo - Or visit http://localhost:3000
echo.

echo Opening control panel...
timeout /t 2 >nul
start "" index.html

echo.
pause
