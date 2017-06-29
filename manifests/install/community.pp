# == Class observium::install
#
# This class is called from observium for install.
#
class observium::install:community (

  ){

  class { 'staging':
  path  => '/tmp/staging',
  owner => 'puppet',
  group => 'puppet',
}
staging::file { 'observium-community-latest.tar.gz':
  source => 'http://www.observium.org/observium-community-latest.tar.gz',
  }

  staging::extract { 'observium-community-latest.tar.gz':
    target  => '/opt/',
    creates => '/opt/observium',
    require => Staging::File['observium-community-latest.tar.gz'],
  }

file {'/opt/observium/config.php':
  ensure  => file,
  source  => 'puppet:///modules/observium/config.php.default',
  require => Staging::Extract['observium-community-latest.tar.gz'],
  }

}
