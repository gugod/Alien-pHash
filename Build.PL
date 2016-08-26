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
        'Alien::Base' => 0,
    },
    requires => {
        'perl' => '5.8.1',
        'Alien::Base' => 0,
        'Alien::CImg' => 0.01,
    },
    alien_name => 'pHash',
    alien_repository => {
        protocol => "local",
        location => "inc",
        # protocol => 'http',
        # host     => 'phash.org',
        # location => '/releases',
        exact_filename  => 'pHash-0.9.6.tar.gz',
        # pattern => qr/pHash-([\d.]+)\.tar\.gz$/,
    },
    alien_build_commands => [
        '%c --prefix=%s --disable-pthread --disable-video-hash --disable-audio-hash',
        'make',
        'make install'
    ],
    alian_env => {
        XYZ => "blah",
        CFLAGS => Alien::CImg->cflags,
        CXXFLAGS => Alien::CImg->cflags,
    }
);

$builder->create_build_script;
