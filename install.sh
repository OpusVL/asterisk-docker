#!/bin/sh

apt-get update

apt-get install -y \
  festival \
  libedit-dev \
  libjansson-dev \
  libldap2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  openssl \
  supervisor \
  uuid-dev

apt-get autoclean

useradd asterisk
echo "asterisk:Obelix" | chpasswd
