#!/bin/bash
echo "🔄 Checking if the application is already running..."

# Check if PM2 is installed
if ! command -v pm2 &> /dev/null; then
    echo "❌ PM2 is not installed. Please install it before running this script."
    exit 1
fi

echo "✅ PM2 is installed."
