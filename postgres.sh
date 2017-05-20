#!/usr/bin/env bash

declare CWD=$(pwd)

sudo dnf install nano -y
sudo dnf upgrade -y

# https://fedoraproject.org/wiki/PostgreSQL

sudo dnf install postgresql-server postgresql-contrib -y
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
sudo systemctl start postgresql

sudo dnf install pgadmin3 -y

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

cd "$CWD"