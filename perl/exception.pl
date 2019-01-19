#!/usr/bin/perl

# Test osetreni vyjimek v Perlu pomoci eval

print "Zaciname.\n";

eval {
    print "Eval spusten.\n";
    $p1 = shift;
    if($p1 =~ /a/){
        die "Je tam acko.\n";
    }
    print "Acko tam nejspis neni.\n";
};
print $@ if($@);
print "Timto koncim.\n";

__END__
