#!/bin/bash
############################################ 
#  Command description
#
#  Author: Martin Horak <horak.martin@gmail.com>
#  Version: 1.0
#  Date:
#
############################################

## Variables ## ============================
############### ============================
verbose=1

## Functions ## ============================
############### ============================

## Usage ## --------------------------------
Usage() {
    command=`basename $0`
    cat <<EOF


Usage:
    $command [-h] [-qv] [-l logfile] {command}

Command description

Parameters:
    -h  ... This help
    -v  ... More verbose
    -q  ... Less verbose

Bugs:

EOF
    exit
}
## Usage end ## ----------------------------

## Main ## =================================
########## =================================

## Getparam ## -----------------------------
while [[ -n "$1" ]]; do
    i=$(expr substr $1 1 1)
    if [[ $i == '-' ]]; then
        r=$(expr substr $1 2 255)
        while [[ -n "$r" ]]; do
            i=$(expr substr $r 1 1)
            case "$i" in 
                h) Usage ;;
                q) let "verbose -= 1" ;;
                v) let "verbose += 1" ;;
                l) logfile=$2; shift ;;
            esac
            r=$(expr substr $r 2 255)
        done
    else
        parms="$parms $1"
    fi
    shift
done
## Getparam end ## -------------------------
: ${logfile:="skeleton.log"}

echo "Verbose: $verbose"
echo "Logfile: $logfile"
echo "More parameters: $parms"

exit 0;

