use 5.010;
use strict;
use warnings;

package ORDB::CPAN::Mageia;
# ABSTRACT: an ORM for CPAN packages available in Mageia

use ORLite::Mirror {
    url    => 'http://perl.mageia.org/cpan_Mageia.db',
    maxage => 24 * 60 * 60,
};


1;
__END__

=for Pod::Coverage
    dsn
    dbh
    connect(ed)?
    begin
    do
    iterate
    orlite
    pragma
    prepare
    rollback(_begin)?
    select(all|col|row)_.*
    sqlite


=head1 SYNOPSIS

    use ORDB::CPAN::Mageia;
    my $nbmodules = ORDB::CPAN::Mageia::Module->count;
    my $cpandists = ORDB::CPAN::Mageia->selectcol_arrayref(
        'SELECT DISTINCT dist FROM module ORDER BY dist'
    );


=head1 DESCRIPTION

This module is an easy way to fetch a database listing all Perl modules
& distributions packaged within Mageia Linux distribution.

When using it, it will automatically & silently download it from the
original source and copy it in a local directory, letting you focus on
what you want with the data itself.

Check the F<examples> directory for some ideas on how to use it.


=head1 METHODS

Refere to L<ORLite> module, section B<ROOT PACKAGE METHODS>.


=head1 SEE ALSO

You can find more information on this module at:

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/ORDB-CPAN-Mageia>

=item * See open / report bugs

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=ORDB-CPAN-Mageia>

=item * Git repository

L<http://github.com/jquelin/ordb-cpan-mageia>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/ORDB-CPAN-Mageia>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/ORDB-CPAN-Mageia>

=back
