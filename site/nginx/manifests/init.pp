class nginx {
  $nginx_dir = "/etc/nginx"
  $nginx_www = "/var/www"

  File {
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  package { 'nginx':
    ensure => present,
  }

  file { '${nginx_www}':
    ensure => directory,
  }

  file { '${nginx_www}/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }

  file { '/etc/nginx/':
    ensure => directory,
  }

  file { "${nginx_dir}/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Package['nginx'],
  }

  file { "${nginx_dir}/conf.d/default.conf":
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
