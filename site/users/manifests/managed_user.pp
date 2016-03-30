define users::managed_user (
  $group = $title,
  $home_dir = '/home',
  ) {
    user { $title :
      ensure => present,
    }

    file { $home_dir:
      ensure => present,
    }

    file { "${home_dir}/${title}" :
      ensure => directory,
      owner => $title,
      group => $group
    }

    file { "${home_dir}/${title}/.ssh" :
      ensure => directory,
      owner => $title,
      group => $group
    }
  }
