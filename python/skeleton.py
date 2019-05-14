#!/usr/bin/python
# vim:fileencoding=utf-8:tabstop=4:shiftwidth=4:expandtab

############################################ 
#  Program description
#
#  Author: Martin Horak
#  Version: 1.0
#  Date: 
#
############################################
import sys

## Environment ## ==========================
################# ==========================

## Globals ## ============================
test = False
verbose = 1
log = ''

## Functions ## ============================
############### ============================
## Usage ## --------------------------------
def Usage():
    '''Usage help.'''

    usage = """
Usage:
    {script_name} [-h] [-tvq]

Program <desc>

Parameters:
    -h  ... help - this help
    -t  ... test - dry run
    -v  ... verbose - more info
    -q  ... quiet - less info

Bugs:

"""
    print usage.format(script_name = sys.argv[0])
    return
## Usage end ## ----------------------------

## RunCMD ## -------------------------------
def RunCMD(command):
    '''Run command and optionally print it.'''
    if verbose >= 2 or test:
        print('RUN: ', ' '.join(command))
    if not test:
        sub.run(command)
    return
## RunCMD end ## ---------------------------

## Main ## =================================
########## =================================
def main():
    '''Main program description.'''

    global test, verbose, log

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
        print("Parameter read error.")
        Usage()
        return
## Getparam end ## -------------------------

    print "Test: {}".format(test)
    print "Verbose: %d" % verbose
    print "Log: %s" % log
    print "More params:"
    for s in argn:
        print s

    return
## Main end =================================

## Main run =================================
########### =================================
if __name__ == '__main__': 
    main()
