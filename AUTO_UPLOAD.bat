@echo off
title SmartDoc AI - Automatic Upload
color 0B

echo.
echo ========================================
echo    SmartDoc AI - Auto Upload
echo ========================================
echo.

echo IMPORTANT: Before running this script:
echo.
echo 1. Create repository on GitHub:
echo    https://github.com/new
echo    Name: smartdoc-ai
echo    DON'T initialize with README
echo.
echo 2. Get Personal Access Token:
echo    https://github.com/settings/tokens
echo    Scopes: repo (all)
echo    Copy and save the token
echo.
echo 3. Have token ready to paste
echo.

pause

echo.
echo Starting automatic upload...
echo.

REM Configure Git
echo [1/7] Configuring Git...
git config --global user.name "Imam Ul Islam"
git config --global user.email "professorimamulislam@gmail.com"
echo [OK] Git configured

echo.
echo [2/7] Initializing repository...
if exist ".git" (
    echo [INFO] Already initialized
) else (
    git init
    echo [OK] Repository initialized
)

echo.
echo [3/7] Adding files...
git add .
echo [OK] Files staged

echo.
echo [4/7] Creating commit...
git commit -m "Initial commit: SmartDoc AI - Complete AI-powered document processing platform

Features:
- 48 AI-powered tools (PDF, Image, OCR, Text, Security, Media)
- Next.js 14 frontend with beautiful 3D UI
- Node.js Express backend API
- Python FastAPI AI service
- Fully mobile responsive design
- Category slider with navigation arrows
- Control panel with real-time monitoring
- One-click automation scripts
- Complete documentation

Tech Stack:
- Frontend: Next.js, React 18, TailwindCSS, Framer Motion
- Backend: Node.js, Express, Multer
- AI: Python, FastAPI, OpenCV, Tesseract
- Tools: 48 document processing tools

Ready for production deployment!"

if %errorlevel% equ 0 (
    echo [OK] Commit created
) else (
    echo [INFO] No changes or already committed
)

echo.
echo [5/7] Adding remote...
git remote remove origin 2>nul
git remote add origin https://github.com/professorimamulislam/smartdoc-ai.git
echo [OK] Remote added

echo.
echo [6/7] Setting branch...
git branch -M main
echo [OK] Branch set to main

echo.
echo ========================================
echo    Ready to Push!
echo ========================================
echo.
echo Repository: https://github.com/professorimamulislam/smartdoc-ai.git
echo.
echo NEXT STEP:
echo When you press any key, Git will ask for credentials:
echo.
echo   Username: professorimamulislam
echo   Password: [PASTE YOUR TOKEN HERE]
echo.
echo ⚠️ IMPORTANT:
echo   - DON'T type your GitHub password
echo   - USE Personal Access Token (ghp_...)
echo   - Token won't show when pasting (normal)
echo   - Just paste and press Enter
echo.
echo Get token: https://github.com/settings/tokens
echo.

pause

echo.
echo [7/7] Pushing to GitHub...
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo    🎉 SUCCESS! 🎉
    echo ========================================
    echo.
    echo ✅ Project uploaded successfully!
    echo.
    echo Your repository:
    echo https://github.com/professorimamulislam/smartdoc-ai
    echo.
    echo Opening in browser...
    timeout /t 2 >nul
    start "" "https://github.com/professorimamulislam/smartdoc-ai"
    echo.
    echo Next steps:
    echo 1. Add topics: ai, nextjs, react, python, fastapi
    echo 2. Add description
    echo 3. Deploy to Vercel/Railway
    echo 4. Share on social media!
    echo.
) else (
    echo.
    echo ========================================
    echo    ❌ Upload Failed
    echo ========================================
    echo.
    echo Common issues:
    echo.
    echo 1. Authentication failed:
    echo    - Make sure you used Personal Access Token
    echo    - NOT your GitHub password
    echo    - Token format: ghp_xxxxxxxxxxxxx
    echo    - Generate new: https://github.com/settings/tokens
    echo.
    echo 2. Repository doesn't exist:
    echo    - Create: https://github.com/new
    echo    - Name: smartdoc-ai
    echo    - DON'T initialize with README
    echo.
    echo 3. Repository already exists with content:
    echo    - Delete and recreate
    echo    - Or use: git push -f origin main
    echo.
    echo 4. Network issue:
    echo    - Check internet connection
    echo    - Try again
    echo.
    echo Need help?
    echo - Read: GITHUB_UPLOAD_GUIDE.md
    echo - Read: UPLOAD_STEPS.md
    echo.
)

echo.
echo ========================================
pause
