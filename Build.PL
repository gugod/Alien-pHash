use strict;
use warnings;

use Module::Build 0.28;

use lib 'inc';
use My::ModuleBuild;

use Alien::CImg;

my $builder = My::ModuleBuild->new(
    module_name => 'Alien::pHash',
    license => 'mit',
    configure_requires => {
        'Module::Build' => 0.42,
        'Alien::Base' => 0.042,
        'Alien::libsndfile' => 0,
        'Alien::CImg' => 0,
    },
    requires => {
        'perl' => '5.8.1',
        'Alien::Base' => 0,
        'Alien::libsndfile' => 0,
        'Alien::CImg' => 0.01,
    },
    alien_name => 'pHash',
    alien_repository => {
        # protocol => "local",
        # location => "inc",
        protocol => 'http',
        host     => 'phash.org',
        location => '/releases',
        exact_filename  => 'pHash-0.9.6.tar.gz',
        # pattern => qr/pHash-([\d.]+)\.tar\.gz$/,
    },
    alien_build_commands => [
        '%c --prefix=%s --disable-pthread --disable-video-hash',
        'make',
        'make install'
    ],
    alien_extra_site_config => {
        CFLAGS => Alien::CImg->cflags,
        CXXFLAGS => Alien::CImg->cflags,
    }
);

$builder->create_build_script;
