class wordpress::cliinstall{
	require php5::install

	
    if defined(Package['curl']) == false {
      package { 'curl': ensure => present, }
    }

    /*
	exec { 'download-wp-cli':
	 	require => Package['curl'],
		command => '/usr/bin/curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash',
		creates =>  '/root/.wp-cli/bin/wp',  
	}
	*/

	file { "/vagrant/wp-cli/":
	    ensure => "directory",
	}

	file { 'wp-cli-composer':
		require => File["/vagrant/wp-cli/"],		
		source => '/vagrant/puppet/modules/wordpress/files/wp-cli/composer.json',
		path => '/vagrant/wp-cli/composer.json'
	}

	exec { 'download-wp-cli':
		cwd => '/vagrant/wp-cli',
		command => '/usr/local/bin/composer install',
		creates => "/vagrant/wp-cli/bin/wp",
	}

	exec { 'update-wp-cli':
		cwd => '/vagrant/wp-cli',
		command => '/usr/local/bin/composer update',
		require => Exec['download-wp-cli'],
	}

	file { 'vagrant-user-cli-alias':
		path => '/home/vagrant/.bash_aliases',
		content => 'alias wp="sudo /vagrant/wp-cli/bin/wp"',
		owner => 'vagrant',
		mode => 600,
	}
}