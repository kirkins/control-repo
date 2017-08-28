vcsrepo { '/home/pi/pop_machine':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/kirkins/pop-machine-demo.git',
  revision => 'master',
}
