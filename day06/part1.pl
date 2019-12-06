use strict;
use warnings;

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

my $total = 0;
foreach (values %nodes) {
    my $node = $_;
    while ( "" ne $node ) {
        $total += 1;
        $node = $nodes{$node};
    }
}
print "$total\n";
