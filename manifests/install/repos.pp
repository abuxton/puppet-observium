class observium::repos(
  $install_repos  = false,
  $install_epel   = false,
  ) {
  if $install_repos {
    yumrepo{ 'webstatic-release':
      ensure  => present,
      url     => 'https://mirror.webtatic.com/yum/el7/webtatic-release.rpm'
    }
    yumrepo{ 'openms-stable':
      ensure  => present,
      url     => 'http://yum.opennms.org/repofiles/opennms-repo-stable-rhel7.noarch.rpm'
    }
    if $install_epel{
      include ::epel
    }
  }
}
