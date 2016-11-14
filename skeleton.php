#!/usr/bin/php
<?php
####################################################################
#  Popis programu
#
#  Autor: Martin Horak
#  Verze: 1.0
#  Datum: 
#
####################################################################

## Variables ## ============================
############### ============================

## Functions ## ============================
############### ============================

## Usage ## --------------------------------
function Usage(){
    $command = $_SERVER['PHP_SELF'];
    echo <<<END
Popis programu

Pouziti:
    $command [-h] [-d] <host> <key> [<params> ...]

    host   ... cilovy objekt dotazu
    key    ... poptavana metrika
    params ... dalsi parametry dotazu


END;
}
## Usage end ## ----------------------------

## Main ## =================================
########## =================================

## Getparam ## -----------------------------
$debug = 0;
$parms = array();
array_shift($argv);
while($i = array_shift($argv)){
    switch($i) {
    case '-h' :
        Usage();
        exit(1);
    case '-d' :
        $debug = 1;
        break;
    default :
        $parms[] = $i;
    }
}

if(count($parms) < 2){
    Usage();
    exit(1);
}

$host = array_shift($parms);
$key = array_shift($parms);
$keypar = join(" ", $parms);
## Getparam end ## -------------------------



exit;
?>
