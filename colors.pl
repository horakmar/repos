# How to colorize console output

# Colors
our %color = (
        'none' => '[0m',
        'red'  => '[01;31m',
        'green' => '[01;32m',
        'yellow' => '[01;33m',
        'blue'  => '[01;34m',
        'white' => '[01;37m');

if($ENV{'TERM'} ne 'xterm'){
    foreach my $i (keys(%color)){
        $color{$i} = '';
    }
}

print $color{'green'},"Green ",$color{'red'},"Red ",$color{'yellow'},"Yellow ",$color{'blue'},"Blue ",$color{'white'},"White ",$color{'none'},"None",$color{'none'},"\n";
