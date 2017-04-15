#!/usr/bin/env bash

cd /opt/druid

export HOSTIP=$(getent hosts $HOSTNAME | awk '{print $1;}')
java -Ddruid.host=$HOSTIP `cat /opt/druid/conf-quickstart/druid/middleManager/jvm.config | xargs` -cp "/opt/druid/conf-quickstart/druid/_common:/opt/druid/conf-quickstart/druid/middleManager:/opt/druid/lib/*" io.druid.cli.Main server middleManager

