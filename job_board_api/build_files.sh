#install dependences
pip install -r requirements.txt

# Collect static files
python3.9 manage.py collectstatic --noinput
