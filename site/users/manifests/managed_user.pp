define users::managed_user (
  $group = $title,
  $home_dir = "/home/${title}",
  ) {
    user { $title :
      ensure => present,
      home => $home_dir,
      gid => $group,
    }

    file { ["${home_dir}/${title}", "${home_dir}/${title}/.ssh"] :
      ensure => directory,
      owner => $title,
      group => $group,
    }

    group { $title:
      ensure => present
    }
  }
