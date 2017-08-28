vcsrepo { '/home/pi/pop_machine':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/kirkins/pop-machine-demo.git',
  revision => 'master',
}

exec { 'npm start':
  command => "/usr/bin/npm start",
  cwd     => "/home/pi/pop_machine/",
}


