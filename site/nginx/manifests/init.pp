class nginx (
  $package = $nginx::params::package,
  $owner = $nginx::params::owner,
  $group  = $nginx::params::group,
  $docRoot = $nginx::params::docRoot,
  $confDir = $nginx::params::confDir,
  $logDir = $nginx::params::logDir,
  $service = $nginx::params::service,
) inherits $nginx::params {
  File {
    owner  => $owner,
    group  => $group,
    mode   => '0644',
    require => Package[$package],
    notify => Service[$package],
  }

  package { $package:
    ensure => present,
  }

  file { [$docRoot, $confDir, "${confDir}/conf.d"] :
    ensure => directory,
  }

  file { "${docRoot}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }

  file { "${confDir}/nginx.conf":
    ensure => file,
    content => template('nginx/nginx.conf.erb'),
    notify => Service[$service],
  }

  file { "${confDir}/conf.d/default.conf":
    ensure => file,
    content => template('nginx/default.conf.erb'),
    notify => Service[$service],
  }

  service { $service:
    ensure => running,
    enable => true,
  }
}
