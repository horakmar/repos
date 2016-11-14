#!/usr/bin/perl
############################################ 
#  Popis funkce programu
#
#  Autor: Martin Horak
#  Verze: 1.0
#  Datum: 
#
############################################
use strict;

## Environment ## ==========================
################# ==========================
if($ENV{PATH} !~ m{/usr/local/bin}){
    $ENV{PATH} = '/usr/local/bin:' . $ENV{PATH};
}

## Variables ## ============================
############### ============================
our $test = 0;
our $verbose = 1;
our @argn = ();

## Functions ## ============================
############### ============================
sub DoCMD{
    my $command = shift;
    print $command, "\n" if($verbose > 1);
    if($test == 0){
        my $err = qx/$command 2>&1/;
        print "Chyba: $err\n" if($? != 0);
    }
}

## Usage ## --------------------------------
sub Usage {
    my $script_name = substr($0, rindex($0, '/')+1);
    print <<"EOF";

Pouziti:
    $script_name [-h] [-tvq]

Program <popis>

Parametry:
    -h  ... help - tato napoveda
    -t  ... test - neprovadet prikazy, pouze vypsat
    -v  ... verbose - vypisovat vice informaci
    -q  ... quiet - vypisovat mene informaci

Chyby:

EOF
    exit 1;
}
## Usage end ## ----------------------------

## Main ## =================================
########## =================================

## Getparam ## -----------------------------
my $arg;
GetP: while(defined($arg = shift)){
    if(substr($arg, 0, 1) eq '-'){
        my @aa = split(//, $arg);
        shift @aa;
        foreach my $i (@aa){
            if($i eq 'h'){ &Usage(); next; };
            if($i eq 't'){ $test = 1; next; };
            if($i eq 'v'){ $verbose++; next; };
            if($i eq 'q'){ $verbose--; next; };
        }
    }else{
        push(@argn, $arg);
    }
}

# push(@argn, '') while(scalar @argn < 2);
## Getparam end ## -------------------------

print "Test: $test\n";
print "Verbose: $verbose\n";
print "Dalsi parametry:\n";
foreach my $i (@argn){
    print "$i\n";
}

exit 0;

__END__

