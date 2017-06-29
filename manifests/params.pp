# == Class observium::params
#
# This class is meant to be called from observium.
# It sets variables according to platform.
#
class observium::params {
  $install_version  = 'community'
  $dbuser           = 'observium'
  $dbpassword       = 'observium'
  $install_location  = '/opt/observium'
  case $::osfamily {
    'RedHat': {

    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
