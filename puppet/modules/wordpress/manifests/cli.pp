define wordpress::cli  (
	$command
){
	require wordpress::cliinstall

	exec { "$command-execute-cli-command":
		require => Exec['download-wp-cli'],
		cwd => '/vagrant/wordpress/',
		command => "/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp $command",
	}
}