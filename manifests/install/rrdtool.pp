# == Class: observium::install::rrdtool
#
class observium::install::rrdtool (
  $install_location = $::observium::params::install_location
  ) inherits observium::params {
  # resources
  if !defined(Package['rrdtool']){
    package { 'rrdtool' :
      ensure => installed,
    }
  }
  file{"${install_location}/rrd" :
    ensure => directory,
    }

}
