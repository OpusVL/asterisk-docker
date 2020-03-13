FROM debian:buster-slim as builder

LABEL maintainer="paul.bargewell@opusvl.com"

COPY ${PWD}/make.sh /

# COPY ${PWD}/asterisk/* /root/

RUN chmod +x /make.sh && /make.sh
