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
) inherits ::observium::params {

  # validate parameters here

  class { "::observium::install":
    install_version => $install_version,
    } ->
  class { '::observium::config':
    } ~>
  class { '::observium::service':
    } ->
  Class['::observium']
}
