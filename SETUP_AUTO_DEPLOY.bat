@echo off
title SmartDoc AI - Setup Auto-Deploy
color 0B

echo.
echo ========================================
echo    SmartDoc AI - Auto-Deploy Setup
echo ========================================
echo.

echo This will setup automatic deployment.
echo After setup, just 'git push' will deploy!
echo.

pause

echo.
echo [1/5] Checking Git repository...
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Initializing Git repository...
    git init
    echo [OK] Git initialized
) else (
    echo [OK] Git repository exists
)

echo.
echo [2/5] Adding configuration files...
git add vercel.json
git add .vercelignore
git add .github/workflows/deploy.yml
git add AUTO_DEPLOY_SETUP.md
git add SETUP_AUTO_DEPLOY.bat
echo [OK] Configuration files added

echo.
echo [3/5] Creating commit...
git commit -m "Setup: Auto-deploy configuration

- Added vercel.json for Vercel configuration
- Added .vercelignore to exclude unnecessary files
- Added GitHub Actions workflow (optional)
- Added auto-deploy documentation
- Configured automatic deployment on push

Now git push will automatically deploy to Vercel!"

if %errorlevel% equ 0 (
    echo [OK] Commit created
) else (
    echo [INFO] No changes or already committed
)

echo.
echo [4/5] Checking remote...
git remote -v | findstr "origin" >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] GitHub remote not configured
    echo.
    echo Please run AUTO_UPLOAD.bat first to setup GitHub!
    echo.
    pause
    exit /b 1
) else (
    echo [OK] GitHub remote configured
)

echo.
echo ========================================
echo    Configuration Ready!
echo ========================================
echo.
echo Files created:
echo   ✅ vercel.json
echo   ✅ .vercelignore
echo   ✅ .github/workflows/deploy.yml
echo   ✅ AUTO_DEPLOY_SETUP.md
echo.
echo Next steps:
echo.
echo 1. Push to GitHub:
echo    git push
echo.
echo 2. Setup Vercel (one time):
echo    a. Visit: https://vercel.com
echo    b. Sign in with GitHub
echo    c. Import: smartdoc-ai
echo    d. Click: Deploy
echo.
echo 3. Done! From now on:
echo    - Any git push automatically deploys
echo    - No manual deployment needed
echo    - Live in 2-3 minutes
echo.
echo Read: AUTO_DEPLOY_SETUP.md for details
echo.

echo.
echo [5/5] Push to GitHub now?
echo.
set /p PUSH="Push changes to GitHub? (y/n): "

if /i "%PUSH%"=="y" (
    echo.
    echo Pushing to GitHub...
    git push
    
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo    Success! Pushed to GitHub
        echo ========================================
        echo.
        echo Next: Setup Vercel (one time)
        echo.
        echo Visit: https://vercel.com
        echo 1. Sign in with GitHub
        echo 2. Import: professorimamulislam/smartdoc-ai
        echo 3. Deploy!
        echo.
        echo After that, every 'git push' auto-deploys!
        echo.
    ) else (
        echo.
        echo ========================================
        echo    Push Failed
        echo ========================================
        echo.
        echo Please check:
        echo 1. GitHub remote configured?
        echo 2. Valid credentials?
        echo 3. Internet connection?
        echo.
    )
) else (
    echo.
    echo ========================================
    echo    Ready to Push Later
    echo ========================================
    echo.
    echo When ready:
    echo   git push
    echo.
    echo Then setup Vercel for auto-deploy!
    echo.
)

echo.
pause
