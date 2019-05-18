#!/usr/bin/env perl

my $full_string = join ' ', @ARGV;
my @lines = split /,/, $full_string;
foreach my $line (@lines) {
    $line =~ s/^\s*//;
    print "$line\n";
}
