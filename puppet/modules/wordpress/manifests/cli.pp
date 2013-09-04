define wordpress::cli  (
	$command
){
	require wordpress::cliinstall

	exec { "$command-execute-cli-command":
		cwd => '/vagrant/wordpress/',
		command => "/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp $command",
	}
}