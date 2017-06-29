class observium::install::db(

  ) inherits observium::params{
    mysql::db { 'observium':
    user     => 'observium',
    password => 'observium',
    host     => 'localhost',
    grant    => ['ALL'],
}

    exec{ '/opt/observium/discovery.php -u >> /opt/observium/logs/db-install.log 2 > &1'  :
      path    => '/usr/bin:/bin',
      creates => '/opt/observium/logs/db-install.log',
      require => Mysql::Db['observium'],
    }
}
