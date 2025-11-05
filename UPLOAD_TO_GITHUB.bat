@echo off
title SmartDoc AI - GitHub Upload Helper
color 0B

echo.
echo ========================================
echo    SmartDoc AI - GitHub Upload
echo ========================================
echo.

echo This script will help you upload to GitHub
echo.

echo Step 1: Make sure you have created a repository on GitHub
echo   - Go to: https://github.com/new
echo   - Name: smartdoc-ai
echo   - Click "Create repository"
echo.

pause

echo.
echo Step 2: Checking Git installation...
where git >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Git is installed
    git --version
) else (
    echo [ERROR] Git not found!
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b
)

echo.
echo Step 3: Configuring Git (if needed)...
echo.

set /p GITNAME="Enter your name (or press Enter to skip): "
if not "%GITNAME%"=="" (
    git config --global user.name "%GITNAME%"
    echo [OK] Name set to: %GITNAME%
)

set /p GITEMAIL="Enter your email (or press Enter to skip): "
if not "%GITEMAIL%"=="" (
    git config --global user.email "%GITEMAIL%"
    echo [OK] Email set to: %GITEMAIL%
)

echo.
echo Step 4: Initializing Git repository...
if exist ".git" (
    echo [INFO] Git already initialized
) else (
    git init
    echo [OK] Git initialized
)

echo.
echo Step 5: Adding files...
git add .
echo [OK] Files staged

echo.
echo Step 6: Creating commit...
git commit -m "Initial commit: SmartDoc AI with 48 AI tools - Complete Next.js frontend - Node.js backend API - Python FastAPI AI service - Fully mobile responsive - Control panel and automation - Complete documentation"
if %errorlevel% equ 0 (
    echo [OK] Commit created
) else (
    echo [INFO] No changes to commit or already committed
)

echo.
echo Step 7: Adding GitHub remote...
echo.

set /p GITHUB_USERNAME="Enter your GitHub username: "
if "%GITHUB_USERNAME%"=="" (
    echo [ERROR] Username required!
    pause
    exit /b
)

set REPO_URL=https://github.com/%GITHUB_USERNAME%/smartdoc-ai.git

git remote remove origin 2>nul
git remote add origin %REPO_URL%
echo [OK] Remote added: %REPO_URL%

echo.
echo Step 8: Ready to push!
echo.
echo Your repository: %REPO_URL%
echo.
echo When you press any key, Git will push to GitHub.
echo You may be asked for credentials:
echo   - Username: %GITHUB_USERNAME%
echo   - Password: Use Personal Access Token (not password)
echo.
echo To create token: https://github.com/settings/tokens
echo.

pause

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo    SUCCESS! Project uploaded!
    echo ========================================
    echo.
    echo Your repository: %REPO_URL%
    echo.
    echo Opening in browser...
    start "" "https://github.com/professorimamulislam/smartdoc-ai"
) else (
    echo.
    echo ========================================
    echo    Upload Failed!
    echo ========================================
    echo.
    echo Common issues:
    echo 1. Authentication failed
    echo    - Use Personal Access Token as password
    echo    - Generate at: https://github.com/settings/tokens
    echo.
    echo 2. Repository doesn't exist
    echo    - Create at: https://github.com/new
    echo.
    echo 3. Permission denied
    echo    - Check repository ownership
    echo    - Try SSH key authentication
    echo.
)

echo.
pause
