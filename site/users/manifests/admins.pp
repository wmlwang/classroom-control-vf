class users::admins {
  users::managed_user { 'jose':
    group => 'jose',
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
