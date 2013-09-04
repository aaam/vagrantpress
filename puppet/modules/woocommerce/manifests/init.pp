# Install latest Wordpress

class woocommerce::install {

  class { 'wordpress::plugin': 
    pluginname => 'woocommerce',
  }


}