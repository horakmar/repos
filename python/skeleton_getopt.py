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
import sys, getopt

## Environment ## ==========================
################# ==========================


## Functions ## ============================
############### ============================
## Usage ## --------------------------------
def Usage():
    '''Usage help'''

    usage = """
Usage:
    {script_name} [-h] [-tvq]

Program <desc>

Parameters:
    -h  ... help - this help
    -t  ... test - dry run
    -v  ... more verbose
    -q  ... more quiet = less verbose

Bugs:

"""
    print(usage.format(script_name = sys.argv[0]))
    return

## Usage end ## ----------------------------

## Main ## =================================
########## =================================
def main():
    '''Main program desc.'''
## Variables ## ============================
    verbose = 1
    logfile = ''
    test = False

## Getparam ## -----------------------------
    try:
        opts, args = getopt.getopt(sys.argv[1:],"htvql:")
    except getopt.GetoptError:
        Usage()
        sys.exit(1)

    for opt, arg in opts:
        if opt == '-h':
            Usage()
            sys.exit()
        elif opt == "-t":
            test = True
        elif opt == "-v":
            verbose += 1
        elif opt == "-q":
            verbose -= 1
        elif opt == "-l":
            logfile = arg
## Getparam end ## -------------------------

    print("Test: {}".format(test))
    print("Verbose: {}".format(verbose))
    print("Log: {}".format(logfile))
    print("Dalsi parametry:")
    for s in args:
        print(s)

## Main end =================================

## Main run =================================
########### =================================
if __name__ == '__main__':
    main()
