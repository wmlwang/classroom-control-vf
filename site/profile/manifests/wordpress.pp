class profile::wordpress {
	# Mysql Server

	# WordPress Config

	# Apache VHost Config

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

