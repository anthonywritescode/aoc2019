use strict;
use warnings;
use List::Util qw( min );

if ($#ARGV != 0) {
    print "usage: $0 FILENAME\n";
    exit 1;
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
    or die "Could not open file '$ARGV[0]' $!";

my %nodes = ("COM" => "");
while (my $row = <$fh>) {
    chomp $row;
    my @spl = split('\)', $row);
    $nodes{$spl[1]} = $spl[0];
}

my %you_hops;
my $you_node = $nodes{"YOU"};
my $you_i = 0;
while ( $you_node ne "COM" ) {
    $you_hops{$you_node} = $you_i;
    $you_i += 1;
    $you_node = $nodes{$you_node};
}

my %san_hops;
my $san_node = $nodes{"SAN"};
my $san_i = 0;
while ( $san_node ne "COM" ) {
    $san_hops{$san_node} = $san_i;
    $san_i += 1;
    $san_node = $nodes{$san_node};
}

my @distances = ();
foreach (keys %you_hops) {
    if (exists($san_hops{$_})) {
        push @distances, $you_hops{$_} + $san_hops{$_};
    }
}
my $answer = min @distances;
print "$answer\n";
