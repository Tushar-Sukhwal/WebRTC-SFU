#!/bin/bash

echo "🔐 Testing Authentication System..."
echo ""

# Test user registration
echo "Testing user registration..."
register_response=$(curl -s -X POST https://t3000.tusharsukhwal.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "email": "test@example.com",
    "password": "password123"
  }')

if echo "$register_response" | grep -q "token"; then
    echo "✅ User registration successful"
    
    # Extract token from response
    token=$(echo "$register_response" | grep -o '"token":"[^"]*' | cut -d'"' -f4)
    echo "📝 Token: ${token:0:20}..."
    
    # Test authenticated endpoint
    echo ""
    echo "Testing authenticated endpoint..."
    me_response=$(curl -s -H "Authorization: Bearer $token" https://t3000.tusharsukhwal.com/api/auth/me)
    
    if echo "$me_response" | grep -q "test@example.com"; then
        echo "✅ Authentication working correctly"
        echo "👤 User data: $me_response"
    else
        echo "❌ Authentication failed"
        echo "Response: $me_response"
    fi
    
else
    echo "❌ Registration failed"
    echo "Response: $register_response"
fi

echo ""
echo "🎯 Authentication system test complete!" 