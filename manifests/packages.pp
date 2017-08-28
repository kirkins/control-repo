exec { 'apt-get update':
  command => "/usr/bin/apt-get update"
}

$packages = [ 
  'unattended-upgrades',
  'git',
  'node',
  'fortune',
]

package { 
  $packages: ensure => installed,
}

exec { 'apt-get clean':
  command => "/usr/bin/apt-get clean"
}
