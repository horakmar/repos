#!/usr/bin/perl

our $nodes = 'all';

## Verify ## --------------------------------------
sub Verify{
    my $node = shift;
    my $r = qx/ping -c 1 -w 2 -q $node 2>&1/;
    if($? != 0){
        print STDERR "Server $node neni dostupny!\n" if($verbose > 0);
        return 0;
    }
    return 1;
}
## Verify end ## ----------------------------------

## Node list ## -----------------------------------
my $dsh_list = (-f $ENV{'DSH_LIST'}) ? $ENV{'DSH_LIST'} : "/etc/dsh_list";
my @node_list = ();
if($nodes eq 'all'){
    if(open(DSH_LIST, '<', $dsh_list)){
        while(<DSH_LIST>){
            unless(/^#/){
                chomp;
                push(@node_list, $_);
            }
        }
        close DSH_LIST;
    }
}else{
    @node_list = split(/,/, $nodes);
}
## Node list end ## -------------------------------

## SSH config file ## -----------------------------
my $ssh_cmd = "ssh";
SSHCONF:{
    if(-f "$ENV{HOME}/.ssh/config_batch"){ $ssh_cmd = "ssh -F $ENV{HOME}/.ssh/config_batch"; last }
    if(-f "$ENV{HOME}/.ssh/config"){ $ssh_cmd = "ssh -F $ENV{HOME}/.ssh/config"; last }
    if(defined($ENV{USER}) && $ENV{USER} ne ''){ $ssh_cmd = "ssh -l $ENV{USER}"; last }
}
## SSH config file end ## -------------------------

