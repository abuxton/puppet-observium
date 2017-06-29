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

) inherits ::observium::params {

  # validate parameters here

  class { '::observium::install':
    } ->
  class { '::observium::config': } ~>
  class { '::observium::service': } ->
  Class['::observium']
}
