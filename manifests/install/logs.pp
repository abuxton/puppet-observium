#
class observium::install::logs(
    $install_location = $observium::params::install_location,
  ) inherits observium::params  {

  file{ "${install_location}/logs" :
    ensure => directory,
    owner  => 'apache',
    group  => 'apache',
    }

  file{ '/var/log/observium'  :
    ensure => link,
    target => "${install_location}/logs",
    }
}
