#!/bin/bash

set -e

echo "🔧 Building WASM with wasm-pack..."
wasm-pack build --target web

echo "🚀 Starting local server at http://localhost:8080"

# Serve with http-server if available
if command -v http-server &> /dev/null; then
    http-server .
# Fallback: use Python's built-in HTTP server
elif command -v python3 &> /dev/null; then
    python3 -m http.server 8080
else
    echo "❌ No HTTP server found. Please install http-server (npm) or use Python 3."
    exit 1
fi
