exec { 'apt-get update':
  command => "/usr/bin/apt-get update"
}

$packages = [ 
  'unattended-upgrades',
  'git',
  'nodejs',
]

package { 
  $packages: ensure => installed,
}
