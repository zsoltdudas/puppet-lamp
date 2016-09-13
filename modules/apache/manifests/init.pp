class apache (
  $apache_name  = $::apache::params::apache_name,
  $conffile     = $::apache::params::conffile,
  $confsource   = $::apache::params::confsource,
  $www          = $::apache::params::www,
) inherits ::apache::params {

  firewall { '100 allow apache':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '80',
    proto   => 'tcp',
    action  => 'accept',
  }

  package { 'apache':
    name    => $apache_name,
    ensure  => present,
  }

  file { 'configuration-file':
    path    => $conffile,
    ensure  => file,
    source  => $confsource,
    notify  => Service['apache-service'],
  }

  service { 'apache-service':
    name	  => $apache_name,
    ensure     => running,
    enable     => true,
    hasrestart	  => true,
  }

  file { $www:
    ensure  => present,
    source  => 'puppet:///modules/www/index.php',
    require => Package[apache],
    notify  => Service[apache-service],
  }

}
