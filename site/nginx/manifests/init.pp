class nginx {
  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  package { 'nginx':
    ensure => present,
  }

  file { '/var/www':
    ensure => directory,
  }

  file { '/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }

  file { '/etc/nginx/':
    ensure => directory,
  }

  file { "/etc/nginx/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Package['nginx'],
  }

  file { "/etc/nginx/conf.d/default.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Package['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
