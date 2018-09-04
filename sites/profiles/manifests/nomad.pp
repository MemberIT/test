# Profile nomad
# =============
#
# Class: profiles::nomad
# ======================
#
class profiles::nomad {
  class { '::nomad':
    config_hash     => lookup('nomad::config_hash', Hash, 'deep', {}),
    config_defaults => lookup('nomad::config_defaults', Hash, 'deep', {}),
  }
}
