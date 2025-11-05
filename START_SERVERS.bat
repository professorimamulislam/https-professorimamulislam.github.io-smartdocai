@echo off
title SmartDoc AI - Starting All Services
color 0A

echo.
echo ========================================
echo    SmartDoc AI - Service Launcher
echo ========================================
echo.

echo [1/3] Starting Backend Server (Node.js)...
start "Backend Server" cmd /k "cd backend && node server.js"
timeout /t 3 >nul

echo [2/3] Starting AI Service (Python)...
start "AI Service" cmd /k "cd backend && python ai_service.py"
timeout /t 3 >nul

echo [3/3] Starting Frontend (Next.js)...
start "Frontend" cmd /k "npm run dev"
timeout /t 5 >nul

echo.
echo ========================================
echo    All Services Started!
echo ========================================
echo.
echo Frontend:    http://localhost:3000
echo Backend:     http://localhost:3001
echo AI Service:  http://localhost:8001
echo.
echo Opening Control Panel...
timeout /t 2 >nul

start "" index.html

echo.
echo Control Panel opened in browser.
echo Keep this window open to monitor services.
echo.
echo Press any key to close this launcher...
pause >nul
