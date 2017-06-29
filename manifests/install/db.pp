class observium::install::db(
  $dbuser       = $::observium::params::dbname,
  $dbpassword   = $::observium::params::dbpassword,
  ) inherits observium::params{
    mysql::db { 'observium':
    user     => $dbuser,
    password => $dbpassword',
    host     => 'localhost',
    grant    => ['ALL'],
}

    exec{ '/opt/observium/discovery.php -u >> /opt/observium/logs/db-install.log 2>&1'  :
      path    => '/usr/bin:/bin',
      creates => '/opt/observium/logs/db-install.log',
      require => Mysql::Db['observium'],
    }
}
