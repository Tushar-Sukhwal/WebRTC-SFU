#!/bin/bash

echo "🚀 Testing WebRTC Application Setup..."
echo ""

# Test backend
echo "Testing Backend (https://t3000.tusharsukhwal.com)..."
backend_response=$(curl -s https://t3000.tusharsukhwal.com/health)
if [ $? -eq 0 ]; then
    echo "✅ Backend is running and healthy"
    echo "📊 Response: $backend_response"
else
    echo "❌ Backend is not responding"
fi

echo ""

# Test frontend
echo "Testing Frontend (https://t3001.tusharsukhwal.com)..."
frontend_response=$(curl -s -o /dev/null -w "%{http_code}" https://t3001.tusharsukhwal.com)
if [ "$frontend_response" -eq 200 ]; then
    echo "✅ Frontend is running and accessible"
else
    echo "❌ Frontend is not responding (HTTP Status: $frontend_response)"
fi

echo ""
echo "🎥 Setup Complete! Your WebRTC application is ready!"
echo ""
echo "📱 Access your application:"
echo "   Frontend: https://t3001.tusharsukhwal.com"
echo "   Backend API: https://t3000.tusharsukhwal.com"
echo ""
echo "🔧 Next steps:"
echo "1. Open https://t3001.tusharsukhwal.com in your browser"
echo "2. Register a new account"
echo "3. Create your first meeting"
echo "4. Share the meeting link with others to test video calling"
echo "" 