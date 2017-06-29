class observium::install::db(

  ) inherits observium::params{

    mysql_grant{'observium@localhost':
      user       => 'observium@localhost',
      table      => 'observium.*',
      privileges => ['ALL'],
    }
    exec{ '/opt/observium/discovery.php -u >> /opt/observium/logs/db-install.log 2 > &1'  :
      path    => '/usr/bin:/bin',
      creates => '/opt/observium/logs/db-install.log',
      require => Mysql_grant['observium@localhost'],
    }
}
