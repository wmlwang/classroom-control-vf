class nginx {
  $nginx_dir = '/etc/nginx'

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

  file { "${nginx_dir}/":
    ensure => directory,
  }

  file { "${nginx_dir}/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { "${nginx_dir}/conf.d/default.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
