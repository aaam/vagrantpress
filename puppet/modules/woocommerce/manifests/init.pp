# Install latest Wordpress

class woocommerce::install {
  
  package { 'curl':
    ensure => present,
  }

  exec { 'download-wp-cli': #tee hee
    command => '/usr/bin/curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash',
    creates =>  '/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp',  
  }

  exec { 'untar-woocommerce':
    cwd     => '/vagrant/wordpress',
    command => '/root/.wp-cli/vendor/wp-cli/wp-cli/bin/wp plugin install woocommerce',
    require => Exec['download-wp-cli'],
    creates => '/vagrant/wordpress/wp-content/plugins/woocommerce',
  }




}