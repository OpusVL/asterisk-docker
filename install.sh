
#!/bin/sh

apt-get update

apt-get install -y \
  festival \
  libedit-dev \
  libjansson-dev \
  libldap2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libsrtp2-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  odbc-postgresql \
  openssl \
  postgresql-client \
  supervisor \
  unixodbc \
  unixodbc-dev \
  uuid-dev

apt-get autoclean

useradd asterisk
echo "asterisk:Obelix" | chpasswd
