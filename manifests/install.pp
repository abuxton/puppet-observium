# == Class observium::install
#
# This class is called from observium for install.
#
class observium::install (
  $install_repos,
  $install_epel,
  ){
  if $install_repos {
    class { '::observium::install::repos':
      $install_epel  => $install_epel,
    } ->
  }

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

}
