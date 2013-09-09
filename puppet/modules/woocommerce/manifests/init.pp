# Install latest Wordpress

class woocommerce::install {

	wordpress::plugin {	'woocommerce-plugin':
		pluginname => 'woocommerce',
	}


}