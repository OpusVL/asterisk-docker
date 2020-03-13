#!/bin/sh

# apk add \
#   alpine-sdk \
#   git \
#   libedit-dev \
#   libuuid-dev \
#   libxml2-dev
  # openssh
  # libcurses5-dev \
  # libssl-dev \
  # ntp

apt-get update

apt-get install -y \
  build-essential \
  curl \
  doxygen \
  git \
  libedit-dev \
  libjansson-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  openssl \
  sqlite3 \
  uuid-dev 

# mkdir -p ~/.ssh && ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts

# ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -P '' 
# git config --global user.name "git.opusvl" 
# git config --global user.email "nobody@opusvl.com" 
# eval "$(ssh-agent -s)" 
# ssh-add ~/.ssh/id_rsa

git clone https://github.com/asterisk/asterisk.git /asterisk
cd /asterisk
./configure
make
make menuselect
make install
make config
make samples
make progdocs
