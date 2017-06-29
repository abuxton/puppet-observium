# == Class observium::config
#
# This class is called from observium for service config.
#
class observium::config {
  include observium::install
  file {'/opt/observium/config.php':
    ensure  => file,
    source  => 'puppet:///modules/observium/config.php.default',
    require => Class['observium::install'],
    }
}
