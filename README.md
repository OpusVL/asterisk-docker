# Asterisk 17 PBX

Uses `debian:buster-slim` because `uuid-dev` is not available in Alpine.

Builds Asterisk 17 from git master.

Multi-stage Dockerfile uses build-essential and git to clone from the git repository https://github.com/asterisk/asterisk.git

First stage installs the prerequisites and builds Asterisk from source. Second stage copies the compiled assets from the first, sets up the asterisk user and sets permissions.

`/etc/asterisk` is populated with the config samples from `make samples`. Mount your own folder to overwrite the samples.

## Build

```shell
$ docker build -t opusvl/asterisk:latest .
```

## Usage

```shell
$ docker run -v ${PWD}/etc/asterisk/:/etc/asterisk:rw ${PWD}/log/:/var/log/asterisk:rw opusvl/asterisk bash
```

### docker-compose.yml

```yaml
version: '3'

services:
  asterisk:
    image: opusvl/asterisk:latest
    volumes:
      - "${PWD}/etc/asterisk/:/etc/asterisk:rw"
      - "${PWD}/log:/var/log/asterisk:rw"
    ports:
      - "5060:5060/tcp"
      - "5060:5060/udp"
      - "5038:5038"
      - "8088:8088"
```