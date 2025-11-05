# 🚀 SmartDoc AI

**AI-powered document processing platform with 48 intelligent tools**

A modern, production-ready web application built with Next.js, React, and Python FastAPI. Features beautiful 3D animations, complete mobile responsiveness, and 48 AI-powered document processing tools.

## ✨ Features

### 🛠️ **48 AI-Powered Tools**
- **PDF Tools (8)**: Text extraction, editing, merging, splitting, compression, protection, watermarking
- **Image Processing (9)**: Background removal, enhancement, color correction, cropping, resizing, filters, format conversion
- **OCR & Scanning (6)**: Document scanner, image to text, ID card scanner, receipt scanner, business card reader, table extractor
- **AI Text Tools (6)**: Translation, summarization, grammar checking, keyword extraction, text analytics, plagiarism detection
- **Generators (6)**: QR codes, email templates, invoices, file conversion, PDF to Word/Excel
- **Security (4)**: File encryption, password generation, digital signatures, virus scanning
- **Media Tools (4)**: Speech to text, video subtitles, audio enhancement, video compression

### 🎨 **Modern UI/UX**
- 🌓 **Dark/Light Mode**: Smooth theme switching
- 📱 **Mobile Responsive**: Perfect on all devices (320px - 4K)
- 🎭 **3D Animations**: Beautiful Framer Motion effects
- 💎 **Glass-morphism**: Modern translucent design
- ⚡ **Fast**: Optimized performance
- 👆 **Touch-Optimized**: Mobile-first approach
- 🔄 **Category Slider**: Horizontal scroll with navigation arrows

### 🎛️ **Control Panel**
- 📊 **Real-time Monitoring**: Auto-refresh service status
- 🚀 **One-Click Launch**: Start all services automatically
- ✅ **Health Checks**: Visual status indicators
- 🔧 **Auto-Fix**: Built-in troubleshooting scripts

## Tech Stack

### Frontend
- **Next.js 14**: React framework for production
- **TailwindCSS**: Utility-first CSS framework
- **Lucide React**: Beautiful icon library
- **Axios**: HTTP client for API requests

### Backend
- **Node.js + Express**: API gateway and PDF processing
- **Python FastAPI**: AI image processing service
- **OpenCV**: Computer vision for image enhancement
- **Tesseract OCR**: Optical character recognition
- **pdf-parse & pdf-lib**: PDF manipulation

## Prerequisites

- **Node.js** (v18 or higher)
- **Python** (v3.8 or higher)
- **Tesseract OCR** (for document scanning)

### Installing Tesseract OCR

**Windows:**
```bash
# Download installer from: https://github.com/UB-Mannheim/tesseract/wiki
# Install and add to PATH or update path in backend/ai_service.py
```

**macOS:**
```bash
brew install tesseract
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install tesseract-ocr
```

## Installation

### 1. Clone the repository
```bash
cd smartdoc-ai
```

### 2. Install Frontend Dependencies
```bash
npm install
```

### 3. Install Python Dependencies
```bash
cd backend
pip install -r requirements.txt
# or with virtual environment
python -m venv venv
venv\Scripts\activate  # Windows
# source venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
cd ..
```

## 🚀 Running the Application

### Quick Start (Recommended) - Windows
```bash
# One-click start all services
START_SERVERS.bat

# This will:
# ✅ Start Backend (Node.js) on port 3001
# ✅ Start AI Service (Python) on port 8001  
# ✅ Start Frontend (Next.js) on port 3000
# ✅ Open Control Panel automatically
```

### Manual Start
You need to run three services simultaneously:

#### Terminal 1: Next.js Frontend
```bash
npm run dev
```
Access at: http://localhost:3000

#### Terminal 2: Node.js Backend
```bash
npm run backend
# or manually
node backend/server.js
```
Running at: http://localhost:3001

#### Terminal 3: Python AI Service
```bash
npm run ai-server
# or manually
cd backend
python ai_service.py
```
Running at: http://localhost:8001

### Control & Monitoring
```bash
# Open Control Panel
index.html

# Check system health
SYSTEM_CHECK.bat

# Run all tests
TEST_ALL.bat

# Fix common issues
FIX_COMMON_ISSUES.bat

# Stop all services
STOP_SERVERS.bat
```

## Project Structure

```
smartdoc-ai/
├── pages/
│   ├── _app.js              # Next.js app wrapper with dark mode
│   ├── _document.js         # Document structure
│   └── index.js             # Main page with tool selection
├── components/
│   ├── Navbar.js            # Top navigation with dark mode toggle
│   ├── Dashboard.js         # Tool selection dashboard
│   ├── UploadSection.js     # File upload with drag & drop
│   ├── ProcessingProgress.js # Progress bar during processing
│   └── ResultsSection.js    # Display results and download
├── styles/
│   └── globals.css          # Global styles with TailwindCSS
├── backend/
│   ├── server.js            # Node.js Express server
│   ├── ai_service.py        # Python FastAPI AI service
│   ├── requirements.txt     # Python dependencies
│   ├── uploads/             # Temporary file uploads
│   └── processed/           # Processed files
├── package.json
├── next.config.js
├── tailwind.config.js
└── README.md
```

## API Endpoints

### Node.js Backend (Port 3001)
- `POST /api/pdf-to-text` - Extract text from PDF
- `POST /api/pdf-edit` - Edit PDF files
- `POST /api/document-scan` - Scan documents (forwards to AI service)
- `POST /api/wrinkle-fix` - Fix wrinkles (forwards to AI service)
- `POST /api/color-enhance` - Enhance colors (forwards to AI service)
- `GET /download/:filename` - Download processed files

### Python AI Service (Port 8001)
- `POST /ai/document-scan` - OCR processing
- `POST /ai/wrinkle-fix` - Remove wrinkles using OpenCV
- `POST /ai/color-enhance` - Color enhancement algorithms
- `GET /download/:filename` - Download AI-processed files

## Usage

1. **Select a Tool**: Choose from PDF to Text, PDF Editing, Document Scanning, Wrinkle Fixing, or Color Enhancement
2. **Upload File**: Drag and drop or browse to select your file
3. **Process**: Click "Process File" to start the AI processing
4. **Download**: Once complete, download your processed file

## Features in Detail

### PDF to Text
- Extracts all text content from PDF files
- Provides statistics (pages, words, characters)
- Download extracted text as .txt file

### PDF Editing
- View PDF metadata
- Modify PDF properties
- Download edited PDF

### Document Scanning
- OCR technology powered by Tesseract
- Converts images to text
- Supports multiple image formats

### Wrinkle Fixing
- AI-powered wrinkle removal
- Bilateral filtering for smoothness
- Preserves text clarity

### Color Enhancement
- CLAHE (Contrast Limited Adaptive Histogram Equalization)
- Saturation boost
- LAB color space optimization

## Development

### Run in Development Mode
```bash
npm run dev
```

### Build for Production
```bash
npm run build
npm start
```

## Troubleshooting

### Port Already in Use
If any port is already in use, you can modify the ports:
- Frontend: Change in `next.config.js` or use `-p` flag
- Node Backend: Change `PORT` in `backend/server.js`
- Python AI: Change port in `backend/ai_service.py` and update references

### Tesseract Not Found
Make sure Tesseract is installed and in your PATH. For Windows, update the path in `backend/ai_service.py`:
```python
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
```

### CORS Issues
If you encounter CORS issues, ensure all three services are running and CORS is properly configured in both backends.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Author

Created with ❤️ for SmartDoc AI

## Support

For issues and questions, please open an issue in the repository.
