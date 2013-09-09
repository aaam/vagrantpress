exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

class { 'git::install': }
class { 'apache2::install': }
class { 'php5::install': }
class { 'mysql::install': }
class { 'wordpress::install': }
class { 'woocommerce::install': }



wordpress::post { 'test-post':
	require => Class['woocommerce::install'],
	title => 'Jildert rocks',
	content => 'Yes he does',
}

/*
woocommerce::product { 'test-product':
	require => Class['woocommerce::install'],
	title => 'Jildert rocks',
	content => 'Yes he does',
}
*/