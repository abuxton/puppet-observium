# install the following
#php56w.x86_64 php56w-opcache.x86_64 php56w-mysql.x86_64 php56w-gd.x86_64 \
# php56w-posix php56w-mcrypt.x86_64 php56w-pear.noarch
class observium::install::php(
    $php_version = $observium::params::php_version
    ) inherits observium::params {

  class { '::php::globals':
      php_version => $php_version,
    } ->
    class { '::php':
      manage_repos => true
      extensions => {
        bcmath    => { },
        imagick   => {
          provider => pecl,
        },
        xmlrpc    => { },
        memcached => {
          provider        => 'pecl',
          header_packages => [ 'libmemcached-devel', ],
        },
        opcache =>  {},
        gd      =>  {},
        posix   =>  {},
        mcrypt  =>  {},
        pear    =>  {},

  },
    }

}
