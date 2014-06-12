#!/bin/sh

#$Id: runmake.sh,v 1.2 2007/07/10 08:45:42 mjb Exp $

make -C "`dirname "$1"`" -f "$1"