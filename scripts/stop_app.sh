#!/bin/bash
echo "Stopping existing application..."
pm2 stop all || true
