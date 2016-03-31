class profiles::wordpress {
	# Mysql Server

	# WordPress Config

	# Apache VHost Config

	# Setup Wordpress
	class { '::wordpress': 	
		wp_owner    => 'wordpress',
		wp_group    => 'wordpress',
		db_user     => 'wordpress',
		db_password => 'hvyH(S%t(\"0\"16',
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

