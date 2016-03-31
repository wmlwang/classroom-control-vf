class nginx::params {
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
}