class observium::install::db(

  ) inherits observium::params{
    include ::mysql
    mysql_grant{'observium@localhost':
      user       => 'observium@localhost',
      table      => 'observium.*',
      privileges => ['ALL'],
    }
}
