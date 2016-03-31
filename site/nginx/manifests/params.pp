class nginx::params {
	case $::osfamily {
    'redhat', 'debian' : {
      $package = 'nginx'
      $owner = 'root'
      $group  = 'root'
      $docroot = '/var/www'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
      $service = 'nginx'
    }
    'windows' : {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group  = 'Administrators'
      $docroot = 'C:/ProgramData/nginx/html'
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs'
      $service = 'nginx'
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