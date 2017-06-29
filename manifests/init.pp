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
  $install_version = $observium::params::install_version,
  $install_location = $observium::params::install_location,
) inherits ::observium::params {

  # validate parameters here

  class { "::observium::install"  :
    install_version => $install_version,
    install_location => $install_location,
    } ->
  class { '::observium::config' :
    } ~>
  Class['::observium']
}
