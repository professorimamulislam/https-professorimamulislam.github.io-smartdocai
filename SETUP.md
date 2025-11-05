# SmartDoc AI - Quick Setup Guide

## Step-by-Step Setup

### 1. Install Node.js Dependencies
```powershell
cd "d:\TEXT DOCUMENT\smartdoc-ai"
npm install
```

### 2. Install Python Dependencies
```powershell
cd backend
python -m venv venv
.\venv\Scripts\activate
pip install -r requirements.txt
cd ..
```

### 3. Install Tesseract OCR (Required for Document Scanning)

**Windows:**
1. Download from: https://github.com/UB-Mannheim/tesseract/wiki
2. Install to default location: `C:\Program Files\Tesseract-OCR`
3. Add to PATH or update line 26 in `backend/ai_service.py`:
   ```python
   pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
   ```

### 4. Start All Services

**Option A: Use npm scripts (3 separate terminals)**

Terminal 1 - Frontend:
```powershell
npm run dev
```

Terminal 2 - Node Backend:
```powershell
npm run backend
```

Terminal 3 - Python AI Service:
```powershell
npm run ai-server
```

**Option B: Manual start**

Terminal 1:
```powershell
npm run dev
```

Terminal 2:
```powershell
node backend/server.js
```

Terminal 3:
```powershell
cd backend
.\venv\Scripts\activate
uvicorn ai_service:app --reload --port 8001
```

### 5. Access the Application

Open your browser and go to:
```
http://localhost:3000
```

## Verify Services

- Frontend: http://localhost:3000
- Node Backend: http://localhost:3001/api/health
- Python AI Service: http://localhost:8001

## Troubleshooting

### If npm install fails:
```powershell
npm cache clean --force
npm install
```

### If Python packages fail:
```powershell
pip install --upgrade pip
pip install -r backend/requirements.txt
```

### Port conflicts:
- Check if ports 3000, 3001, 8001 are available
- Kill conflicting processes or change ports in config files

### Tesseract not working:
- Verify installation: `tesseract --version`
- Update path in `backend/ai_service.py`

## Next Steps

1. Try uploading a PDF for text extraction
2. Test image enhancement features
3. Explore document scanning with OCR
4. Toggle dark/light mode

Enjoy SmartDoc AI! 🚀
