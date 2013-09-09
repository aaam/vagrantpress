class wordpress::cliinstall{
	require php5::install

	package { 'curl':
		ensure => present,
	}

	exec { 'download-wp-cli':
	 	require => Package['curl'],
		command => '/usr/bin/curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash',
		creates =>  '/root/.wp-cli/bin/wp',  
	}
}