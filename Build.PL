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

    # BEGIN XXX: there is no such property yet. In
    # Alien::Base::ModuleBuild#L759[1], the content of config.site is
    # not tweakable by any parameters. That makes it impossible to add
    # cflags for "configure" script. Alien::Base needs to be changed.
    # [1]: https://github.com/gugod/Alien-Base/blob/master/lib/Alien/Base/ModuleBuild.pm#L759
    alien_extra_site_config => {
        CFLAGS => Alien::CImg->cflags,
        CXXFLAGS => Alien::CImg->cflags,
    }
    # END XXX
);

$builder->create_build_script;
