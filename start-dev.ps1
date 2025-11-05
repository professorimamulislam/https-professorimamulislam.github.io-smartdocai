# SmartDoc AI - Development Server Startup Script
# Run this script to start all three services in separate windows

Write-Host "Starting SmartDoc AI Development Servers..." -ForegroundColor Green
Write-Host ""

# Get the current directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start Next.js Frontend
Write-Host "Starting Next.js Frontend (Port 3000)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath'; Write-Host 'Frontend Server' -ForegroundColor Green; npm run dev"

# Wait a bit before starting next service
Start-Sleep -Seconds 2

# Start Node.js Backend
Write-Host "Starting Node.js Backend (Port 3001)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath'; Write-Host 'Node.js Backend' -ForegroundColor Yellow; npm run backend"

# Wait a bit before starting next service
Start-Sleep -Seconds 2

# Start Python AI Service
Write-Host "Starting Python AI Service (Port 8001)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\backend'; Write-Host 'Python AI Service' -ForegroundColor Magenta; if (Test-Path '.\venv\Scripts\Activate.ps1') { .\venv\Scripts\Activate.ps1 }; uvicorn ai_service:app --reload --port 8001"

Write-Host ""
Write-Host "All services starting!" -ForegroundColor Green
Write-Host "Wait a few seconds, then open http://localhost:3000" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to exit this window (services will continue running)..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
