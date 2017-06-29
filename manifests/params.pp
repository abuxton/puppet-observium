# == Class observium::params
#
# This class is meant to be called from observium.
# It sets variables according to platform.
#
class observium::params {
  case $::osfamily {
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
