# Role nomad
# ==========
#
# Class: roles::nomad
# ===================
#
class roles::nomad {
  contain ::profiles::docker
  contain ::profiles::nomad

  Class['::profiles::docker'] ->
    Class['::profiles::nomad']

  if $::hostname == 'nomad3' {
    class { '::profiles::echo':
      stage => 'after',
    }
  }
}
