#!/bin/bash

cd ${0%/*}

test -e AppletLocal.html -a -e cibib.policy || ./setup.sh

curl -s -O -z "$(TZ=GMT ls -lT cibib.jar 2>/dev/null | tr -s ' ' | cut -d' ' -f6-9)" https://ibank.cib.hu/cibib.jar
appletviewer $PWD/AppletLocal.html -J-Djava.security.policy=$PWD/cibib.policy -J-Duser.dir=$HOME/Desktop > /dev/null 2>&1 &

