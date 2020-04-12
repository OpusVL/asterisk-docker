#!/bin/sh

apt-get update

apt-get install -y \
  build-essential \
  curl \
  git \
  libedit-dev \
  libjansson-dev \
  libldap2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  odbc-postgresql \
  openssl \
  postgresql-client \
  sqlite3 \
  unixodbc \
  unixodbc-dev \
  uuid-dev 

git clone https://github.com/asterisk/asterisk.git /asterisk
cd /asterisk
./configure
make
make menuselect
make install
make config
make samples
