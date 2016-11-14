#!/usr/bin/ksh
############################################ 
#  Popis funkce programu
#
#  Autor: Martin Horak
#  Verze: 1.0
#  Datum: 
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


Pouziti: 
    $command [-h] [-qv] {prikaz}

Popis prikazu

Parametry:
    -h  ... tato napoveda
    -v  ... zvysuje vyrecnost
    -q  ... snizuje vyrecnost

Chyby:

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
            esac
            r=$(expr substr $r 2 255)
        done
    else
        parms="$parms $1"
    fi
    shift
done
## Getparam end ## -------------------------
echo "Verbose: $verbose"
echo "Dalsi parametry: $parms"

exit 0;

