use 5.010;
use strict;
use warnings;

package ORDB::CPAN::Mageia;
# ABSTRACT: orlite for module table in database

# -- attributes

=attr module

The name of the module, eg C<ORDB::CPAN::Mageia>.

=attr version

The version of the module (neither the dist, nor the package). It may be
null.

=attr dist

This is the CPAN distribution the module is part of, eg
C<ORDB-CPAN-Mageia>. It may be null.

=attr pkgname

This is the name of the package holding this module in Mageia Linux
distribution. Chances are that it looks like C<perl-ORDB-CPAN-Mageia>.

=cut



1;
__END__

=for Pod::Coverage
    base
    count
    iterate
    rowid
    select
    table(_info)?


=head1 DESCRIPTION

This class models the C<module> table in the database. It can be used
either with class methods, or as objects mapping one row of the table.

=head1 METHODS

Refere to L<ORLite> module, section B<TABLE PACKAGE METHODS>.
