class observium::install::logs(

  )inherits observium::params{

  file{ '/opt/observium/logs':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
  }

  file{ '/var/log/observium':
    ensure  => link,
    target  =>  '/opt/observium/logs'
  }
}
