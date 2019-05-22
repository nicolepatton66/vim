#!/usr/bin/env perl

my $full_string = join ' ', @ARGV;

my @sections = split />, #</, $full_string;
foreach my $section (@sections) {
    $section =~ s/^#<//;
    $section =~ s/>$//;

    $section =~ s/^(\w+) //;
    my $name = $1;
    print "$name:\n";

    my @lines = sort split /,/, $section;
    foreach my $line (@lines) {
        $line =~ s/^\s*//;
        print "  $line\n";
    }

    print "\n";
}
