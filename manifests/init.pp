# Class: observium
# ===========================
#
# Full description of class observium here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class observium (
  Boolean $install_repos  = $::observium::params::install_repos,
  Boolean $install_epel   = $::observium::params::install_epel,
) inherits ::observium::params {

  # validate parameters here

  class { '::observium::install':
        install_repos => $install_repos,
        install_epel  => $install_epel,
    } ->
  class { '::observium::config': } ~>
  class { '::observium::service': } ->
  Class['::observium']
}
