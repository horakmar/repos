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
import argparse

## Environment ## ==========================
################# ==========================


## Functions ## ============================
############### ============================

## Main ## =================================
########## =================================
def main():
    '''Main program desc.'''

    parser = argparse.ArgumentParser()

    parser.add_argument("-v", "--verbose", help="More information", action="count", default=1)
    parser.add_argument("-q", "--quiet", help="Less information", action="count", default=0)
    parser.add_argument("-l", "--logfile", help="File to do logging in")
    parser.add_argument("-t", "--test", help="Test run", action="store_true")
    parser.add_argument("param", help="Parameter", nargs="?", default="Vole")

    args = parser.parse_args()
    verbose = args.verbose - args.quiet

    print(f"Test: {args.test}")
    print(f"Verbose: {verbose}")
    print(f"Log: {args.logfile}")
    print(f"Dalsi parametr: {args.param}")

## Main end =================================

## Main run =================================
########### =================================
if __name__ == '__main__':
    main()
