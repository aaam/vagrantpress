class wordpress::plugin  (
	$pluginname
){
	

	$plugin_exists = "test -e /vagrant/wordpress/wp-content/plugins/$pluginname"

	#//if $plugin_exists.exitcode != 0 {
	    wordpress::cli{ 'install-plugin': 
		    command => "plugin install $pluginname",
		  }


		  wordpress::cli{ 'activate-plugin': 
		    command => "plugin activate $pluginname",
		  }
	#//}
 

}