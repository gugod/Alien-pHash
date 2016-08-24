use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
  module_name => 'Alien::pHash',
  dist_abstract => 'Build and install libphash',
  license => 'gpl',
  configure_requires => {
    'Alien::Base' => 0,
  },
  requires => {
    'perl' => '5.8.1',
    'Alien::Base' => 0,
  },
  dist_author => 'Kang-min Liu <gugod@gugod.org>',
  alien_name => 'pHash',
  alien_repository => {
    protocol => 'http',
    host     => 'phash.org',
    location => '/releases',
    exact_filename  => 'pHash-0.9.6.tar.gz',
    # pattern => qr/pHash-([\d.]+)\.tar\.gz$/,
  },
  alien_build_commands => [
    '%c --prefix=%s --enable-shared',
    'make',
    'make install'
  ],
);

$builder->create_build_script;
