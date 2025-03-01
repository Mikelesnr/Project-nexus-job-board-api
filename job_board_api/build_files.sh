#!/bin/bash

# Create the staticfiles_build directory if it doesn't exist
mkdir -p staticfiles

#install dependancies
pip install -r requirements.txt

# Collect static files
python3.9 manage.py collectstatic --noinput
