#install the following
# wget.x86_64 httpd.x86_64 cronie.x86_64 net-snmp.x86_64 \
# net-snmp-utils.x86_64 fping.x86_64 mariadb-server.x86_64 mariadb.x86_64 MySQL-python.x86_64 \
# rrdtool.x86_64 subversion.x86_64 jwhois.x86_64 ipmitool.x86_64 graphviz.x86_64 ImageMagick.x86_64
class observium::install::packages  {
$required_packages = [
                      'php-json',
                      'php-gd',
                      'php-snmp',
                      'vixie-cron',
                      'php-mcrypt',
                      'php-pear',
                      'net-snmp',
                      'net-snmp-utils',
                      'graphviz',
                      'subversion',
                      'ImageMagick',
                      'jwhois',
                      'nmap',
                      'ipmitool',
                      'php-pear.noarch',
                      'MySQL-python',
                      'libvirt',
                      ]

  $required_packages.each |$package| {
    if !defined (Package['$package_name']) {
      package{  $package  :
        ensure => installed,
      }
    }
  }

}
