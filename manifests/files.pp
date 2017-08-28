class directories {

  # a fuller example, including permissions and ownership
  file { '/var/log/pop_machine':
    ensure => 'directory',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0750',
  }
}
