define wordpress::plugin  (
	$pluginname
){
	
    wordpress::cli{ "install-plugin-$pluginname": 
	    command => "plugin install $pluginname",
	    creates => "/vagrant/wordpress/wp-content/plugins/$pluginname",
	    #before => class["activate-plugin-$pluginname"],
	}

	wordpress::cli{ "activate-plugin-$pluginname":
		#require => Wordpress::cli["install-plugin-$pluginname"],
		#require => wordpress::cli["install-plugin-$pluginname"],
		command => "plugin activate $pluginname",
	}
 
 	Wordpress::Cli["install-plugin-$pluginname"] -> Wordpress::Cli["activate-plugin-$pluginname"]

	#wordpress::cli{ "install-plugin-$pluginname"
}