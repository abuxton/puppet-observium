# == Class observium::service
#
# This class is meant to be called from observium.
# It ensure the service is running.
#
class observium::service {

  service { $::observium::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
