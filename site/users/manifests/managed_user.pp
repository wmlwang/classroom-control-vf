define users::managed_user (
  $group = $title,
  $home_dir = '/home',
  ) {
    file { $home_dir:
      ensure => directory,
    }

    user { $title :
      ensure => present,
      home => $home_dir,
    }



    file { ["${home_dir}/${title}", "${home_dir}/${title}/.ssh"] :
      ensure => directory,
      owner => $title,
      group => $group
    }
  }
