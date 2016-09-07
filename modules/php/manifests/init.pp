class php {

  $php_name = $osfamily ? {
    'Debian'    => 'php5',
    'RedHat'    => 'php',
    default     => warning('This distribution is not supported by the PHP module'),
  }

  package { 'php':
    name    => $php_name,
    ensure  => present,
  }

  package { 'php-pear':
    ensure  => present,
  }

}
