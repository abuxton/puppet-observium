class observium::install::db(
  $dbuser           = $::observium::params::dbname,
  $dbpassword       = $::observium::params::dbpassword,
  $install_location = $::observium::params::install_location,
  ) inherits observium::params{
    mysql::db { 'observium':
    user     => $dbuser,
    password => $dbpassword,
    host     => 'localhost',
    grant    => ['ALL'],
}

    exec{ "${install_location}/discovery.php -u >> ${install_location}/logs/db-install.log 2>&1"  :
      path    => '/usr/bin:/bin',
      creates => "${install_location}/logs/db-install.log",
      require => Mysql::Db['observium'],
    }
}
