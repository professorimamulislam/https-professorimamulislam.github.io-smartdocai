# 🎛️ SmartDoc AI - Control Panel Guide

**Created:** 2025-11-05 08:50 AM  
**Purpose:** Central control for all SmartDoc AI services

---

## 🚀 **Quick Start:**

### **Option 1: One-Click Start (Recommended)**
```bash
# Double-click this file:
START_SERVERS.bat

# This will:
✅ Start Backend (Node.js)
✅ Start AI Service (Python)
✅ Start Frontend (Next.js)
✅ Open Control Panel (index.html)
```

### **Option 2: Manual Start**
```bash
# Open index.html in browser
index.html

# Then start services manually if needed
```

---

## 📁 **Files Created:**

### **1. index.html** - Control Panel
```
✅ Beautiful dashboard UI
✅ Real-time service monitoring
✅ Auto-check every 10 seconds
✅ One-click launch to app
✅ Service status indicators
✅ Quick access buttons
```

### **2. START_SERVERS.bat** - Service Launcher
```
✅ Starts all 3 services automatically
✅ Opens separate terminal for each
✅ Opens control panel
✅ Shows service URLs
```

### **3. STOP_SERVERS.bat** - Service Stopper
```
✅ Stops all running services
✅ Kills processes on ports 3000, 3001, 8001
✅ Clean shutdown
```

---

## 🎨 **Control Panel Features:**

### **Dashboard View:**
```
┌─────────────────────────────────────────┐
│         📄✨ SmartDoc AI                │
│   Complete Document Processing Platform │
├─────────────────────────────────────────┤
│                                         │
│  ✅ All Services Online (3/3)          │
│                                         │
├─────────────────────────────────────────┤
│  🌐 Frontend       ⚙️ Backend API      │
│  ● Online          ● Online             │
│  localhost:3000    localhost:3001       │
│  [Open Dashboard]  [View Health]        │
│                                         │
│  🤖 AI Service                          │
│  ● Online                               │
│  localhost:8001                         │
│  [View API Docs]                        │
├─────────────────────────────────────────┤
│                                         │
│       🚀 Launch SmartDoc AI             │
│                                         │
└─────────────────────────────────────────┘
```

### **Service Cards:**
Each service shows:
```
✅ Service name & icon
✅ Status indicator (online/offline)
✅ URL endpoint
✅ Quick action button
✅ Manual recheck button
```

### **Status Indicators:**
```
🟢 Green  → Service Online
🔴 Red    → Service Offline
🟡 Yellow → Checking...
```

---

## 🔧 **How to Use:**

### **First Time Setup:**
```
1. Open folder: d:\TEXT DOCUMENT\smartdoc-ai
2. Double-click: START_SERVERS.bat
3. Wait 10-15 seconds for services to start
4. Control panel opens automatically
5. Click "Launch SmartDoc AI" when all green
```

### **Daily Usage:**
```
Start:
1. Run START_SERVERS.bat
2. Wait for control panel
3. Click launch button

Stop:
1. Run STOP_SERVERS.bat
2. All services stop
```

### **Manual Control:**
```
# Open control panel only
index.html (double-click)

# Check service status
- Auto-updates every 10 seconds
- Or click "Recheck" button

# Access services
- Click service buttons when online
- Opens in new tab
```

---

## 📊 **Service Endpoints:**

### **Frontend (Next.js)**
```
URL:      http://localhost:3000
Port:     3000
Purpose:  Main web application
Features: 48 AI tools, dashboard, upload
```

### **Backend (Node.js)**
```
URL:      http://localhost:3001
Port:     3001
Purpose:  API server, request handling
Health:   /api/health
```

### **AI Service (Python)**
```
URL:      http://localhost:8001
Port:     8001
Purpose:  AI processing, ML models
Docs:     /docs (FastAPI Swagger)
```

---

## 🎯 **Status Messages:**

### **All Services Online (3/3)**
```
✅ Everything working
✅ Launch button enabled
✅ All features available
→ Ready to use!
```

### **Partial Services Online (1-2/3)**
```
⚠️ Some services down
⚠️ Launch button disabled
⚠️ Limited functionality
→ Start missing services
```

### **All Services Offline (0/3)**
```
❌ Nothing running
❌ Launch button disabled
❌ No features available
→ Run START_SERVERS.bat
```

---

## 💡 **Features:**

### **Auto-Monitoring:**
```
✅ Checks services every 10 seconds
✅ Updates status automatically
✅ Visual indicators
✅ No manual refresh needed
```

### **Quick Actions:**
```
✅ One-click app launch
✅ Direct service access
✅ Manual recheck
✅ Service-specific links
```

### **Visual Design:**
```
✅ Beautiful gradient UI
✅ Glass-morphism effects
✅ Responsive layout
✅ Mobile-friendly
✅ Animated indicators
```

### **Developer Tools:**
```
✅ Health check endpoints
✅ API documentation links
✅ Service URLs visible
✅ Status monitoring
```

---

## 🔍 **Troubleshooting:**

### **Services Won't Start:**
```
1. Check if ports are free:
   netstat -ano | findstr "3000 3001 8001"

2. Kill existing processes:
   Run STOP_SERVERS.bat

3. Try starting again:
   Run START_SERVERS.bat
```

### **Control Panel Shows Offline:**
```
1. Wait 10-15 seconds after starting
2. Click "Recheck" button
3. Check terminal windows for errors
4. Ensure all dependencies installed:
   npm install
   pip install -r backend/requirements.txt
```

### **Launch Button Disabled:**
```
→ One or more services offline
→ Start missing services
→ Wait for status update
→ Click recheck if needed
```

---

## 🎨 **Customization:**

### **Change Auto-Refresh Interval:**
```javascript
// In index.html, find:
setInterval(() => {
    checkAllServices();
}, 10000);  // 10 seconds

// Change to your preference (milliseconds)
```

### **Add More Services:**
```javascript
// In index.html, add to services object:
serviceName: {
    url: 'http://localhost:PORT',
    name: 'Service Name',
    checkEndpoint: 'http://localhost:PORT/health'
}
```

---

## 📱 **Mobile Access:**

### **From Phone:**
```
1. Get computer IP:
   ipconfig (look for IPv4)

2. Open on phone:
   http://YOUR_IP:3000

3. Or use control panel:
   http://YOUR_IP/index.html
   (requires local server)
```

---

## 🎊 **Benefits:**

### **Before:**
```
❌ Open 3 terminals manually
❌ Remember all URLs
❌ Check each service separately
❌ Type commands every time
```

### **After:**
```
✅ One-click start all services
✅ Visual status dashboard
✅ Auto-monitoring
✅ Quick access buttons
✅ Professional control panel
```

---

## 📚 **File Structure:**

```
smartdoc-ai/
├── index.html              ← Control Panel (Open this!)
├── START_SERVERS.bat       ← Start all services
├── STOP_SERVERS.bat        ← Stop all services
├── CONTROL_PANEL.md        ← This guide
├── package.json
├── pages/
├── components/
├── backend/
│   ├── server.js          ← Backend server
│   └── ai_service.py      ← AI service
└── ...
```

---

## 🚀 **Quick Reference:**

### **Commands:**
```bash
# Start everything
START_SERVERS.bat

# Stop everything
STOP_SERVERS.bat

# Open control panel
index.html
```

### **URLs:**
```
Control Panel:  file:///d:/TEXT%20DOCUMENT/smartdoc-ai/index.html
Frontend:       http://localhost:3000
Backend:        http://localhost:3001
AI Service:     http://localhost:8001
```

### **Keyboard Shortcuts:**
```
F5 or Ctrl+R → Manual status refresh
Click Launch → Open main app
```

---

## ✨ **Summary:**

**You now have:**
- ✅ Beautiful control panel (index.html)
- ✅ One-click start script (START_SERVERS.bat)
- ✅ One-click stop script (STOP_SERVERS.bat)
- ✅ Real-time service monitoring
- ✅ Auto-status updates
- ✅ Professional dashboard
- ✅ Quick access to all services

**Just double-click START_SERVERS.bat and you're ready!** 🎉

---

*Control Panel Created: 2025-11-05 08:50 AM*  
*SmartDoc AI - Complete Control Solution!* 🎛️✨

