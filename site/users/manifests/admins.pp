class users::admins {
  users::managed_user { 'jose':
    home_dir => '/tmp/homedir'
  }

  users::managed_user { 'alice':
    group => 'admins',
  }

  users::managed_user { 'chen':
    group => 'admins',
  }

  group { 'admins':
    ensure => present
  }
}
