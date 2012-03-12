use 5.010;
use strict;
use warnings;

package ORDB::CPAN::Mageia;
# ABSTRACT: an ORM for CPAN packages available in Mageia

use ORLite::Mirror {
    url    => 'http://pkgcpan.mageia.org/cpan_Mageia.db',
    maxage => 24 * 60 * 60,
};



# -- methods autogenerated by orlite

=method my $string = ORDB::CPAN::Mageia->dsn;

The C<dsn> accessor returns the dbi connection string used to connect to
the SQLite database as a string.


=method my $handle = ORDB::CPAN::Mageia->dbh;

To reliably prevent potential SQLite deadlocks resulting from multiple
connections in a single process, each L<ORLite> package will only ever
maintain a single connection to the database.

During a transaction, this will be the same (cached) database handle.

Although in most situations you should not need a direct DBI connection
handle, the C<dbh> method provides a method for getting a direct
connection in a way that is compatible with ORLite's connection
management.

Please note that these connections should be short-lived, you should
never hold onto a connection beyond the immediate scope.

The transaction system in L<ORLite> is specifically designed so that
code using the database should never have to know whether or not it is
in a transation.

Because of this, you should B<never> call the -E<gt>disconnect method on
the database handles yourself, as the handle may be that of a currently
running transaction.

Further, you should do your own transaction management on a handle
provided by the <dbh> method.

In cases where there are extreme needs, and you B<absolutely> have to
violate these connection handling rules, you should create your own
completely manual DBI-E<gt>connect call to the database, using the
connect string provided by the C<dsn> method.

The C<dbh> method returns a L<DBI::db> object, or throws an exception on
error.


=method ORDB::CPAN::Mageia->begin;

The C<begin> method indicates the start of a transaction.

In the same way that L<ORLite> allows only a single connection, likewise
it allows only a single application-wide transaction.

No indication is given as to whether you are currently in a transaction
or not, all code should be written neutrally so that it works either way
or doesn't need to care.

Returns true or throws an exception on error.


=method ORDB::CPAN::Mageia->commit;

The C<commit> method commits the current transaction. If called outside
of a current transaction, it is accepted and treated as a null
operation.

Once the commit has been completed, the database connection falls back
into auto-commit state. If you wish to immediately start another
transaction, you will need to issue a separate -E<gt>begin call.

Returns true or throws an exception on error.


=method ORDB::CPAN::Mageia->rollback;

The C<rollback> method rolls back the current transaction. If called outside
of a current transaction, it is accepted and treated as a null operation.

Once the rollback has been completed, the database connection falls back
into auto-commit state. If you wish to immediately start another
transaction, you will need to issue a separate -E<gt>begin call.

If a transaction exists at END-time as the process exits, it will be
automatically rolled back.

Returns true or throws an exception on error.


=method ORDB::CPAN::Mageia->do(...);

    ORDB::CPAN::Mageia->do(
        insert into table (foo, bar) values (?, ?)', {},
        $foo_value,
        $bar_value,
    );

The C<do> method is a direct wrapper around the equivalent L<DBI>
method, but applied to the appropriate locally-provided connection or
transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectall_arrayref(...);

The C<selectall_arrayref> method is a direct wrapper around the
equivalent L<DBI> method, but applied to the appropriate locally-
provided connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectall_hashref(...);

The C<selectall_hashref> method is a direct wrapper around the
equivalent L<DBI> method, but applied to the appropriate locally-
provided connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectcol_arrayref(...);

The C<selectcol_arrayref> method is a direct wrapper around the
equivalent L<DBI> method, but applied to the appropriate locally-
provided connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectrow_array(...);

The C<selectrow_array> method is a direct wrapper around the equivalent
L<DBI> method, but applied to the appropriate locally-provided
connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectrow_arrayref(...);

The C<selectrow_arrayref> method is a direct wrapper around the
equivalent L<DBI> method, but applied to the appropriate locally-
provided connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->selectrow_hashref(...);

The C<selectrow_hashref> method is a direct wrapper around the
equivalent L<DBI> method, but applied to the appropriate locally-
provided connection or transaction.

It takes the same parameters and has the same return values and error
behaviour.


=method ORDB::CPAN::Mageia->prepare(...);

The C<prepare> method is a direct wrapper around the equivalent L<DBI>
method, but applied to the appropriate locally-provided connection or
transaction

It takes the same parameters and has the same return values and error
behaviour.

In general though, you should try to avoid the use of your own prepared
statements if possible, although this is only a recommendation and by no
means prohibited.


=method ORDB::CPAN::Mageia->pragma(...);

  # Get the user_version for the schema
  my $version = ORDB::CPAN::Mageia->pragma('user_version');

The C<pragma> method provides a convenient method for fetching a pragma
for a datase. See the SQLite documentation for more details.

=cut

1;
__END__

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
