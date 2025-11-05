@echo off
title SmartDoc AI - System Check
color 0B

echo.
echo ========================================
echo    SmartDoc AI - System Check
echo ========================================
echo.

echo [1/6] Checking Node.js...
where node >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Node.js installed
    node --version
) else (
    echo [ERROR] Node.js not found!
)

echo.
echo [2/6] Checking Python...
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Python installed
    python --version
) else (
    echo [ERROR] Python not found!
)

echo.
echo [3/6] Checking npm packages...
if exist "node_modules\" (
    echo [OK] node_modules found
) else (
    echo [WARNING] node_modules not found
    echo Run: npm install
)

echo.
echo [4/6] Checking Python packages...
if exist "backend\__pycache__\" (
    echo [OK] Python cache found
) else (
    echo [INFO] Python cache not found (may need pip install)
)

echo.
echo [5/6] Checking ports...
echo.
echo Port 3000 (Frontend):
netstat -ano | findstr ":3000.*LISTENING" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Port 3000 is in use (Frontend running)
) else (
    echo [INFO] Port 3000 is free (Frontend not running)
)

echo.
echo Port 3001 (Backend):
netstat -ano | findstr ":3001.*LISTENING" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Port 3001 is in use (Backend running)
) else (
    echo [INFO] Port 3001 is free (Backend not running)
)

echo.
echo Port 8001 (AI Service):
netstat -ano | findstr ":8001.*LISTENING" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Port 8001 is in use (AI Service running)
) else (
    echo [INFO] Port 8001 is free (AI Service not running)
)

echo.
echo [6/6] Checking critical files...
echo.

if exist "package.json" (echo [OK] package.json) else (echo [ERROR] package.json missing)
if exist "pages\index.js" (echo [OK] pages\index.js) else (echo [ERROR] pages\index.js missing)
if exist "components\AdvancedDashboard.js" (echo [OK] components\AdvancedDashboard.js) else (echo [ERROR] components\AdvancedDashboard.js missing)
if exist "components\Navbar3D.js" (echo [OK] components\Navbar3D.js) else (echo [ERROR] components\Navbar3D.js missing)
if exist "backend\server.js" (echo [OK] backend\server.js) else (echo [ERROR] backend\server.js missing)
if exist "backend\ai_service.py" (echo [OK] backend\ai_service.py) else (echo [ERROR] backend\ai_service.py missing)

echo.
echo ========================================
echo    System Check Complete!
echo ========================================
echo.

echo Summary:
echo - If all services are running, you're good to go!
echo - If not, run START_SERVERS.bat
echo - Open index.html for visual dashboard
echo.

pause
