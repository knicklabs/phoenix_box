#!/usr/bin/env bash

echo "Beging provisioning using config/vagrant/postgresql.sh"

APP_DB_USER=postgres
APP_DB_PASS=postgres

PG_VERSION=9.4

print_db_usage () {
  echo "Your PostgreSQL database has been setup and can be accessed on your local machine on the forwarded port (default: 5432)"
  echo "  Host: localhost"
  echo "  Port: 5432"
  echo "  Database: <DATABASE_NAME>"
  echo "  Username: $APP_DB_USER"
  echo "  Password: $APP_DB_PASS"
  echo ""
  echo "Admin access to postgres user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
  echo "psql access to app database user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost <DATABASE_NAME>"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$APP_DB_USER:$APP_DB_PASS@localhost:5432/<DATABASE_NAME>"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost -p 5432 <DATABASE_NAME>"
}

export DEBIAN_FRONTEND=noninteractive

PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > "$PG_REPO_APT_SOURCE"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

apt-get update
apt-get -y upgrade

apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION"
apt-get -y install libpq-dev

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"
sudo sh -c 'echo "host  all  all  all  md5" >> "$PG_HBA"'
sudo sh -c 'echo "client_encoding = utf8" >> "$PG_CONF"'

sudo service postgresql restart

cat << EOF | su - postgres -c psql
-- Give the default database user a password:
ALTER USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';
EOF

date > "$PROVISIONED_ON"
echo "Successfully created PostgreSQL dev virtual machine."
echo ""
print_db_usage

echo "End provisioning using config/vagrant/postgresql.sh"
