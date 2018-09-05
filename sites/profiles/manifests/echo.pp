# Profile echo
# ============
#
# Class: profiles::echo
# =====================
#
class profiles::echo {
  exec { 'Deploy_job_echo':
    user      => 'root',
    command   => "sleep 10; nomad job run -address=http://${::ipaddress_enp0s8}:4646 /etc/puppetlabs/code/environments/production/.nomad/job-echo.nomad",
    path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin',
    tries     => 3,
    try_sleep => 20,
  }
}
