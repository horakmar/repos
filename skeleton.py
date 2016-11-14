#!/usr/bin/python
# vim:fileencoding=utf-8:tabstop=4:shiftwidth=4

############################################ 
#  Popis funkce programu
#
#  Autor: Martin Horak
#  Verze: 1.0
#  Datum: 
#
############################################
import sys

## Environment ## ==========================
################# ==========================


## Functions ## ============================
############### ============================
## Usage ## --------------------------------
def Usage():
    '''Usage help'''

    usage = """
Pouziti:
    {script_name} [-h] [-tvq]

Program <popis>

Parametry:
    -h  ... help - tato napoveda
    -t  ... test - neprovadet prikazy, pouze vypsat
    -v  ... verbose - vypisovat vice informaci
    -q  ... quiet - vypisovat mene informaci

Chyby:

"""
    print usage.format(script_name = sys.argv[0])
    return

## Usage end ## ----------------------------

## Main ## =================================
########## =================================
def main():
    '''Hlavni program'''

## Variables ## ============================
############### ============================
    test = False
    verbose = 1
    log = ''

## Getparam ## -----------------------------
    argn = []
    args = sys.argv;
    i = 1
    try:
        while(i < len(args)):
            if(args[i][0] == '-'):
                for j in args[i][1:]:
                    if j == 'h':
                        Usage()
                        return
                    elif j == 't':
                        test = True
                    elif j == 'v':
                        verbose += 1
                    elif j == 'q':
                        verbose -= 1
                    elif j == 'l':
                        i += 1
                        log = args[i]
            else:
                argn.append(args[i])
            i += 1
    except IndexError:
        print("Chyba cteni parametru.")
        Usage()
        return
## Getparam end ## -------------------------

    print "Test: {}".format(test)
    print "Verbose: %d" % verbose
    print "Log: %s" % log
    print "Dalsi parametry:"
    for s in argn:
        print s

    return
## Main end =================================
########### =================================

## Spusteni main ============================
########### =================================
if __name__ == '__main__': 
    main()
