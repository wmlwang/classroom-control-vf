class profile::wordpress {
	# Mysql Server
	class { '::mysql::server':
	  root_password => 'password',
	}

	class { '::mysql::bindings':
		php_enable => true,	
	}

	# WordPress Config

	# Apache VHost Config
	class { 'apache': 
		default_vhost => false,
	}
	include apache::mod::php 
	apache::vhost { '54.191.123.11/port/31009/':
	  port    => '80',
	  docroot => '/var/www/wordpress',
	}

	# Setup Wordpress
	class { '::wordpress': 	
		wp_owner    => 'wordpress',
		wp_group    => 'wordpress',
		install_dir => '/var/www/wordpress',

	}

	#Local User for Wordpress
	user { 'wordpress': 
		ensure => present,
	}

	#Local Group for wordpress

	group { 'wordpress': 
		ensure => present,
	}
}

