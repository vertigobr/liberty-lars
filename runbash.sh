#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
#echo "ENVBASH=$ENVBASH"
docker run --rm -ti -p 9080:9080 vertigo/liberty-lars:latest $ENVBASH ${@:2}
