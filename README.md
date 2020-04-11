# Asterisk 17 PBX

Uses `debian:buster-slim` because `uuid-dev` is not available in Alpine.

Builds Asterisk 17 from git master.

Multi-stage Dockerfile uses build-essential and git to clone from the git repository https://github.com/asterisk/asterisk.git

First stage installs the prerequisites and builds Asterisk from source. Second stage copies the compiled assets from the first, sets up the asterisk user and sets permissions.

> Now includes the Festival Text-To-Speach Server and LDAP support.

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

__Note:__ Use `network_mode: "host"` as the RTP service requires a large port range and it takes a long time to setup thousands of iptable rules if it uses a docker network.

```yaml
version: '3'

services:
  asterisk:
    image: opusvl/asterisk:latest
    volumes:
      - "${PWD}/etc/asterisk/:/etc/asterisk:rw"
      - "${PWD}/log:/var/log/asterisk:rw"
    network_mode: "host"
    ports:
      - "1314"
      - "5060:5060/tcp"
      - "5060:5060/udp"
      - "5038:5038"
      - "8088:8088"
      - "10000-20000:10000-20000/udp"
```

## LDAP Support

You will need to import the [`asterisk.ldif`](asterisk.ldif) schema into your LDAP configuration. This is an olc format file, if you need the older schema format you'll find it in the link below.

Full details are here: [Asterisk LDAP Integration](http://asteriskdocs.org/en/3rd_Edition/asterisk-book-html-chunk/ExternalServices_id291590.html)

## Festival TTS

Festival is a default install listening on TCP port 1314 - but does not need to be exposed.

## Supervisor

Supervisor is used to start the two programs (festival and asterisk) within the container. The supervisor configuration is included as [`asterisk.conf`](./asterisk.conf)