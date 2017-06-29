# == Class observium::install
#
# This class is called from observium for install.
#
class observium::install::community (

  ) inherits observium::params {

  include ::staging

  class { 'staging' :
    path  => '/tmp/staging',
    owner => 'puppet',
    group => 'puppet',
  }

  staging::file { 'observium-community-latest.tar.gz' :
    source => 'http://www.observium.org/observium-community-latest.tar.gz',
  }

  staging::extract { 'observium-community-latest.tar.gz'  :
    target  => '/opt/',
    creates => '/opt/observium',
    require => Staging::File['observium-community-latest.tar.gz'],
  }

}
