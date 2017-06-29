# == Class: observium::install
#
class observium::install (
  $install_version = $observium::params::install_version
  )inherits observium::params {
  # resources

  class { '::observium::install::packages' :
    } ->
  class { '::observium::install::$install_version'  :
    } ->
  class { '::observium::install::logs'  :
    } ->
  class { '::observium::install::rrdtool' :
    } ->
  class { '::observium::install::db'  :
      }
}
