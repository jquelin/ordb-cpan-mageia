#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use ORDB::CPAN::Mageia;

# select all cpan distnames
my $cpandists = ORDB::CPAN::Mageia->selectcol_arrayref(
    'SELECT DISTINCT dist FROM module ORDER BY dist'
);

say $_ for grep { defined } @$cpandists;

exit;
__END__

=head1 DESCRIPTION

This small script prints all CPAN distributions available in Mageia,
one per line.
