define wordpress::cli  (
	$command,
	$creates = '',
){
	require wordpress::cliinstall

	exec { "$command-execute-cli-command":
		creates => $creates,
		require => Exec['download-wp-cli'],
		cwd => '/vagrant/wordpress/',
		command => "/root/.wp-cli/bin/wp $command",
	}
}