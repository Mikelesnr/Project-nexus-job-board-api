python3.12 -m pip install --upgrade pip
python3.12 -m pip install virtualenv
python3.12 -m virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

python3.12 manage.py collectstatic --noinput
