#!/bin/bash

# Exit on errors
set -e

# Create and activate the virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create the staticfiles_build directory if it doesn't exist
mkdir -p staticfiles_build

# Collect static files
python manage.py collectstatic --noinput
