# Install latest Wordpress

class woocommerce::install {

  class { 'wordpress::plugin': 
    pluginname => 'woocommerce',
  }

  /*
  exec { 'install-woocommerce':
    cwd     => '/vagrant/wordpress',
    command => '/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp plugin install woocommerce',
   // require => Exec['download-wp-cli'],
    creates => '/vagrant/wordpress/wp-content/plugins/woocommerce',
  }
  */



}