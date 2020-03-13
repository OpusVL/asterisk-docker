#!/bin/sh


if [ "$1" = "" ]; then
  COMMAND="/usr/sbin/asterisk -T -W -U asterisk -p -vvvdddf"
else
  COMMAND="$@"
fi

chown -R asterisk:  /var/log/asterisk \
                    /var/lib/asterisk \
                    /var/run/asterisk \
                    /var/spool/asterisk
exec ${COMMAND}

