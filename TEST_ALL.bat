@echo off
title SmartDoc AI - Complete System Test
color 0B

echo.
echo ========================================
echo    SmartDoc AI - Complete Test
echo ========================================
echo.

echo [TEST 1/5] Frontend Test...
echo Checking http://localhost:3000
curl -s -o nul -w "Status: %%{http_code}" http://localhost:3000
if %errorlevel% equ 0 (
    echo  - [OK]
) else (
    echo  - [FAIL]
)

echo.
echo [TEST 2/5] Backend Health Test...
echo Checking http://localhost:3001/api/health
curl -s http://localhost:3001/api/health
if %errorlevel% equ 0 (
    echo  - [OK]
) else (
    echo  - [FAIL]
)

echo.
echo [TEST 3/5] AI Service Test...
echo Checking http://localhost:8001/
curl -s http://localhost:8001/
if %errorlevel% equ 0 (
    echo  - [OK]
) else (
    echo  - [FAIL]
)

echo.
echo [TEST 4/5] File Structure Test...
echo.
set PASS=0
set FAIL=0

if exist "package.json" (echo [OK] package.json && set /a PASS+=1) else (echo [FAIL] package.json && set /a FAIL+=1)
if exist "pages\index.js" (echo [OK] pages\index.js && set /a PASS+=1) else (echo [FAIL] pages\index.js && set /a FAIL+=1)
if exist "components\AdvancedDashboard.js" (echo [OK] AdvancedDashboard.js && set /a PASS+=1) else (echo [FAIL] AdvancedDashboard.js && set /a FAIL+=1)
if exist "components\Navbar3D.js" (echo [OK] Navbar3D.js && set /a PASS+=1) else (echo [FAIL] Navbar3D.js && set /a FAIL+=1)
if exist "components\UploadSection3D.js" (echo [OK] UploadSection3D.js && set /a PASS+=1) else (echo [FAIL] UploadSection3D.js && set /a FAIL+=1)
if exist "backend\server.js" (echo [OK] backend\server.js && set /a PASS+=1) else (echo [FAIL] backend\server.js && set /a FAIL+=1)
if exist "backend\ai_service.py" (echo [OK] backend\ai_service.py && set /a PASS+=1) else (echo [FAIL] backend\ai_service.py && set /a FAIL+=1)
if exist "styles\globals.css" (echo [OK] styles\globals.css && set /a PASS+=1) else (echo [FAIL] styles\globals.css && set /a FAIL+=1)

echo.
echo Files OK: %PASS% / 8

echo.
echo [TEST 5/5] Control Files Test...
echo.

if exist "index.html" (echo [OK] index.html) else (echo [MISSING] index.html)
if exist "START_SERVERS.bat" (echo [OK] START_SERVERS.bat) else (echo [MISSING] START_SERVERS.bat)
if exist "STOP_SERVERS.bat" (echo [OK] STOP_SERVERS.bat) else (echo [MISSING] STOP_SERVERS.bat)

echo.
echo ========================================
echo    Test Summary
echo ========================================
echo.

echo Services Status:
netstat -ano | findstr ":3000.*LISTENING" >nul 2>&1 && echo [ONLINE] Frontend (3000) || echo [OFFLINE] Frontend (3000)
netstat -ano | findstr ":3001.*LISTENING" >nul 2>&1 && echo [ONLINE] Backend (3001) || echo [OFFLINE] Backend (3001)
netstat -ano | findstr ":8001.*LISTENING" >nul 2>&1 && echo [ONLINE] AI Service (8001) || echo [OFFLINE] AI Service (8001)

echo.
echo If all tests pass, system is working!
echo If any test fails, run FIX_COMMON_ISSUES.bat
echo.

pause
