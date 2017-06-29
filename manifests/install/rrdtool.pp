# == Class: observium::install::rrdtool
#
class observium::install::rrdtool {
  # resources
  if !defined(Package['rrdtool']){
    package { 'rrdtool' :
      ensure => installed,
    }
  }
  file{'/opt/observium/rrd' :
    ensure => directory,
    }

}
