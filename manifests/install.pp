# == Class: observium::install
#
class observium::install (
  $install_version = $observium::params::install_version
  $install_location = $install_location,
  )inherits observium::params {
  # resources

  class { '::observium::install::packages' :
    } ->
  class { "::observium::install::${install_version}"  :
    install_location => $install_location,
    } ->
  class { '::observium::install::logs'  :
    install_location => $install_location,
    } ->
  class { '::observium::install::rrdtool' :
    install_location => $install_location,
    } ->
  class { '::observium::install::db'  :
    install_location => $install_location,
      }
}
