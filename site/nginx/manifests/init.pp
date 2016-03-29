class nginx {
  package { 'nginx':
    ensure => present,
  }

  file { '/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  file { '/etc/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/index.html',
  }

  file { '/etc/nginx/':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/nginx.conf',
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/default.conf',
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
