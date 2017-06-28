# == Class observium::install
#
# This class is called from observium for install.
#
class observium::install {

  package { $::observium::package_name:
    ensure => present,
  }
}
