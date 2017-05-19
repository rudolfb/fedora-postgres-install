sudo dnf install nano -y
sudo dnf upgrade -y

# https://fedoraproject.org/wiki/PostgreSQL

sudo dnf install postgresql-server postgresql-contrib -y
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
sudo systemctl start postgresql

sudo dnf install pgadmin3 -y

sudo su - postgres
PASSWD=$(psql -At -c "select passwd from pg_shadow where usename ='postgres'")
if [[ -z "$PASSWD" ]]; then
    psql -U postgres template1 -c "alter user postgres with password 'postgres';"
fi

exit
