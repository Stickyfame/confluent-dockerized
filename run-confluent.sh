#!/bin/bash

CONFLUENT_USER=$1
CONFLUENT_PASSWORD=$2

if [ -z ${CONFLUENT_USER} ]; then
	echo "error with confluent user"
	exit 1
fi

if [ -z ${CONFLUENT_PASSWORD} ]; then
	echo "error with confluent password"
	exit 1
fi

echo "user set to: ${CONFLUENT_USER}"

rm -rf /run/httpd/* /tmp/httpd*

/opt/confluent/bin/confluent
source /etc/profile.d/confluent_env.sh && confetty create /users/${CONFLUENT_USER} password=${CONFLUENT_PASSWORD} role=admin

exec /usr/sbin/apachectl -D FOREGROUND
