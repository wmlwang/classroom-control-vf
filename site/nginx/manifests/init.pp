class nginx (
  $root,
) {
  case $::osfamily {
    'redhat', 'debian' : {
      $package = 'nginx'
      $owner = 'root'
      $group  = 'root'
      #$docRoot = '/var/www'
      $confDir = '/etc/nginx'
      $logDir = '/var/log/nginx'
      $service = 'nginx'
      $docRoot = $root ? {
          undef => '/var/www',
          default => $root,
      }
    }
    'windows' : {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group  = 'Administrators'
      #$docRoot = 'C:/ProgramData/nginx/html'
      $confDir = 'C:/ProgramData/nginx'
      $logDir = 'C:/ProgramData/nginx/logs'
      $service = 'nginx'
      $docRoot = $root ? {
          undef => '/var/www',
          default => $root,
      }
    }
  }

  

  case $::osfamily {
    'redhat' : {
      $user = 'nginx'
    }
    'debian' : {
      $user = 'www-data'
    }
    'windows' : {
      $user = 'nobody'
    }
  }

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
