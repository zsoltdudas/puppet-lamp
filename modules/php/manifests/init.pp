class php {

  $php_name = $osfamily ? {
    'Debian'    => ['php5', 'php5-mysql', 'libapache2-mod-php5'],
    'RedHat'    => ['php', 'php-mysql', 'php-common', 'php-gd', 'php-mbstring', 'php-devel', 'php-xml'],
    default     => warning('This distribution is not supported by the PHP module'),
  }

  package { 'php':
    name    => $php_name,
    ensure  => present,
  }

  package { 'php-pear':
    ensure  => present,
  }

  service { 'php-service':
    name    => $php_name,
    ensure  => running,
    enable  => true,
  }

}
