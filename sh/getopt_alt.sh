#!/bin/ksh

# Get parameters from commandline

parms=''
remove=0
all=0

while [ -n "$1" ]; do
    case "$1" in 
		--*) ;;
		-*) opts=$opts${1#-} ;;
         *) parms="$parms $1" ;;
    esac
	while [ -n "$opts" ]; do
		i=`echo $opts | cut -c 1`
		case "$i" in
		  a) all=1 ;;
		  r) remove=1 ;;
		esac
		opts=`echo $opts | cut -c 2-`
	done
    shift
done

echo "all = $all; remove = $remove"
echo "opts = $opts"
echo "parms = $parms"
