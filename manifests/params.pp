# == Class observium::params
#
# This class is meant to be called from observium.
# It sets variables according to platform.
#
class observium::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'observium'
      $service_name = 'observium'
    }
    'RedHat', 'Amazon': {
      $package_name = 'observium'
      $service_name = 'observium'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
