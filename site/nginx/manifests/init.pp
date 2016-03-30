class nginx {
  $nginx_dir = '/etc/nginx'
  $nginx_www = '/var/www'

  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  package { 'nginx':
    ensure => present,
  }

  file { $nginx_www:
    ensure => directory,
  }

  file { "${nginx_www}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }

  file { $nginx_dir:
    ensure => directory,
  }

  file { "${nginx_dir}/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
  }

  file { "${nginx_dir}/conf.d/default.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
