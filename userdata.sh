#!/bin/bash
apt-get update -y
apt-get install git -y
apt-get install python3.8 -y
cd /home/ubuntu/
TOKEN="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"
git clone https://$TOKEN@github.com/urdevops/blog-website-app.git
cd /home/ubuntu/blog-website-app
apt-get install python3-pip -y
apt-get install python3.8-dev default-libmysqlclient-dev -y
apt-get install libjpeg-dev -y
pip install testresources
pip3 install -r requirements.txt
cd /home/ubuntu/blog-website-app/src
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80
