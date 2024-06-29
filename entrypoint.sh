#!/bin/bash
set -e

# Create symbolic links for necessary files
ln -sf /app/main.py /app/workspace/main.py
ln -sf /app/.env /app/workspace/.env

# Change to the workspace directory
cd /app/workspace

# Run the main Python script
exec python main.py