#
class observium::install::logs(
    $install_location = $observium::params::install_location
  ) inherits observium::params  {

  file{ "${install_location}/logs" :
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
    }

  file{ '/var/log/observium'  :
    ensure => link,
    target => "${install_location}/logs",
    }
}
