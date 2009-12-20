#!/bin/sh
CHECKOUT_CMD='svn checkout --username physaris --password xE8Mq4XY6tX2'
URL='https://fuddle.googlecode.com/svn/trunk'
if [ ! -z $1 ]; then
	echo "checking out" $1 "..."
	${CHECKOUT_CMD} ${URL}/$1
fi
#svn checkout --username physaris --password xE8Mq4XY6tX2 https://fuddle.googlecode.com/svn/trunk/ fuddle 
