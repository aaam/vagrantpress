class wordpress::plugin  (
	$pluginname
){
	

  wordpress::cli{ 'install-plugin': 
    command => "plugin install $pluginname"
  }


  wordpress::cli{ 'activate-plugin': 
    command => "plugin activate $pluginname"
  }

	/*
	exec { 'install-plugin':
		cwd => '/vagrant/wordpress/',
		command => "/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp plugin install $pluginname",
	}
	*/
}