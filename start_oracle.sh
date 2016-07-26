#!/bin/bash

## Change the container's hostname
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" \
	/u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora

## Start the Oracle service
/etc/init.d/oracle-xe start

## Tail the logs to keep the container running
tail -f /u01/app/oracle/product/11.2.0/xe/config/log/*

