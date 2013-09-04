class wordpress::cliinstall{
	package { 'curl':
		ensure => present,
	}

	exec { 'download-wp-cli':
		command => '/usr/bin/curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash',
		creates =>  '/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp',  
	}
}