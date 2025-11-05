#!/bin/bash
# SmartDoc AI - Development Server Startup Script (Linux/Mac)

echo "Starting SmartDoc AI Development Servers..."
echo ""

# Start Next.js Frontend
echo "Starting Next.js Frontend (Port 3000)..."
gnome-terminal -- bash -c "cd '$(pwd)' && echo 'Frontend Server' && npm run dev; exec bash" 2>/dev/null || \
xterm -e "cd '$(pwd)' && echo 'Frontend Server' && npm run dev; bash" 2>/dev/null || \
osascript -e 'tell app "Terminal" to do script "cd '"$(pwd)"' && echo \"Frontend Server\" && npm run dev"' 2>/dev/null &

sleep 2

# Start Node.js Backend
echo "Starting Node.js Backend (Port 3001)..."
gnome-terminal -- bash -c "cd '$(pwd)' && echo 'Node.js Backend' && npm run backend; exec bash" 2>/dev/null || \
xterm -e "cd '$(pwd)' && echo 'Node.js Backend' && npm run backend; bash" 2>/dev/null || \
osascript -e 'tell app "Terminal" to do script "cd '"$(pwd)"' && echo \"Node.js Backend\" && npm run backend"' 2>/dev/null &

sleep 2

# Start Python AI Service
echo "Starting Python AI Service (Port 8001)..."
gnome-terminal -- bash -c "cd '$(pwd)/backend' && echo 'Python AI Service' && [ -f venv/bin/activate ] && source venv/bin/activate; uvicorn ai_service:app --reload --port 8001; exec bash" 2>/dev/null || \
xterm -e "cd '$(pwd)/backend' && echo 'Python AI Service' && [ -f venv/bin/activate ] && source venv/bin/activate; uvicorn ai_service:app --reload --port 8001; bash" 2>/dev/null || \
osascript -e 'tell app "Terminal" to do script "cd '"$(pwd)"'/backend && echo \"Python AI Service\" && [ -f venv/bin/activate ] && source venv/bin/activate; uvicorn ai_service:app --reload --port 8001"' 2>/dev/null &

echo ""
echo "All services starting!"
echo "Wait a few seconds, then open http://localhost:3000"
echo ""
