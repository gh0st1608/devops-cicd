#!/bin/sh

# collect all static files to the root directory
python manage.py collectstatic --no-input

# start the gunicorn worker processws at the defined port
gunicorn app.wsgi:application --bind 0.0.0.0:8000 &

#python manage.py runserver 0.0.0.0:8000 &

wait