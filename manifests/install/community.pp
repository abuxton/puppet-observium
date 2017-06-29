# == Class observium::install
#
# This class is called from observium for install.
#
class observium::install::community (
    $install_location = $::observium::params::install_location,
  ) inherits observium::params {

  include ::staging
  if !defined(Class['staging']){
    class { 'staging' :
      path  => '/tmp/staging',
      owner => 'puppet',
      group => 'puppet',
    }
  }
  staging::file { 'observium-community-latest.tar.gz' :
    source => 'http://www.observium.org/observium-community-latest.tar.gz',
  }
  $target = dirname($install_location)
  staging::extract { 'observium-community-latest.tar.gz'  :
    target  => $target,
    creates => $install_location,
    require => Staging::File['observium-community-latest.tar.gz'],
  }

}
