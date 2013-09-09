# Install latest Wordpress

class woocommerce::install {

	wordpress::plugin {	'woocommerce-plugin':
		pluginname => 'woocommerce',
	}

	wordpress::cli{ 'woocommerce-install': 
		require => Wordpress::Plugin['woocommerce-plugin'],		
		command => 'woocommerce install'
	}
}