package Alien::pHash;
use strict;
use warnings;

our $VERSION = 0.01;
$VERSION = eval $VERSION;

use parent 'Alien::Base';

1;

__END__

=head1 NAME

Alien::pHash - pHash distribution for CPAN.

=head1 Description

This is a Alien distribution based on L<Alien::Base>, class methods
such as C<cflags> and C<libs> are inherited from there. See the
documentation for L<Alien::Base> for full list of methods. This module
does not override or extend any of those inherited methods.

pHash stands for "perceptual hash". Quote from the L<phash
website|http://phash.org/>

=over 4

What is a perceptual hash?

A perceptual hash is a fingerprint of a multimedia file derived from
various features from its content. Unlike cryptographic hash functions
which rely on the avalanche effect of small changes in input leading
to drastic changes in the output, perceptual hashes are "close" to one
another if the features are similar.

=back

This CPAN distribution contains only the library (C<libphash.so>). For
interface and using in perl, see L<Phash::FFI>

If you are authoring a CPAN distribution that requires pHash, you could
get the cflags by running this L<palien|App::palien> command:

   palien --cflags Alien::pHash

Or alternativly, this one-liner:

   perl -MAlien::pHash -E 'say Alien::pHash->cflags'

Run this command to obtain the library flags

   palien --cflags Alien::pHash

Or alternativly, this one-liner:

   perl -MAlien::pHash -E 'say Alien::pHash->libs'

See also L<palien|App::palien> and L<Alien::Base>

=head1 AUTHOR

Kang-min Liu <gugod@gugod.org>

=cut
