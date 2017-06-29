# == Class observium::config
#
# This class is called from observium for service config.
#
class observium::config (
    $install_location => $::observium::params::install_location,
  ) inherits ::observium::params {
  include observium::install
  file {  "${install_location}/config.php" :
    ensure  => file,
    source  => 'puppet:///modules/observium/config.php.default',
    require => Class['observium::install'],
    }
}
