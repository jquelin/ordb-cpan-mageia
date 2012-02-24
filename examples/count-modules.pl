#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use ORDB::CPAN::Mageia;

my $nbmodules = ORDB::CPAN::Mageia->count;
say "$nbmodules modules found";

exit;
__END__

=head1 DESCRIPTION

This small script prints the number of Perl modules available in
Mageia.
