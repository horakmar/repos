#!/bin/sh

# Get parameters from commandline

remove=0
all=0

while [ -n "$1" ]; do
    case "$1" in 
        -h) help ;;
        -a) all=1 ;;
        -d) remove=1 ;;
         *) parms="$parms $1" ;;
    esac
    shift
done

[ -n "$parms" ] && set $parms
