#!/bin/bash

#install dependences
pip install -r requirements.txt

# Create the staticfiles_build directory if it doesn't exist
mkdir -p staticfiles_build

# Collect static files
python manage.py collectstatic --noinput

