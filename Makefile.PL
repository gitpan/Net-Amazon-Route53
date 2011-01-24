
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Interface to Amazon\'s Route 53',
  'AUTHOR' => 'Marco Fontani',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Net-Amazon-Route53',
  'EXE_FILES' => [
    'bin/route53'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Net::Amazon::Route53',
  'PREREQ_PM' => {
    'Digest::HMAC_SHA1' => '0',
    'FindBin' => '0',
    'Getopt::Long' => '0',
    'HTTP::Request' => '0',
    'LWP::UserAgent' => '0',
    'MIME::Base64' => '0',
    'Mouse' => '0',
    'Pod::Usage' => '0',
    'XML::Bare' => '0'
  },
  'VERSION' => '0.110241',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



