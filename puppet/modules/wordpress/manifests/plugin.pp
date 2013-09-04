class wordpress::plugin  (
	$pluginname
){
	

  wordpress::cli{ 'install-plugin': 
    command => "plugin install $pluginname"
  }


  wordpress::cli{ 'activate-plugin': 
    command => "plugin activate $pluginname"
  }

}