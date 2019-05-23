#!/usr/bin/env perl

my $full_string = join ' ', @ARGV;
$full_string =~ s/^#<//;
$full_string =~ s/>$//;

my @sections = split />, #</, $full_string;
foreach my $section (@sections) {
    $section =~ s/^([a-zA-Z:]+) //;
    print "$1\n";

    my @lines = sort split /, /, $section;
    foreach my $line (@lines) {
        $line =~ s/^\s*//;
        print "  $line\n";
    }

    print "\n";
}
