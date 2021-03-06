class apache (
  $apache_name     = $::apache::params::apache_name,
  $conffile        = $::apache::params::conffile,
  $confsource      = $::apache::params::confsource,
  $www             = $::apache::params::www,
  $package_manager = $::apache::params::package_manager,
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

  if $::osfamily == 'RedHat' {
    file { "/etc/httpd":
        ensure    => directory,
    }

    file { "/etc/httpd/conf":
        ensure    => directory,
    }
  }
  elsif $::osfamily == 'Debian' {
    file { "/etc/apache2":
        ensure    => directory,
    }
  }

  file { 'configuration-file':
    path    => $conffile,
    ensure  => file,
    source  => $confsource,
    notify  => Service['apache-service'],
  }

  service { 'apache-service':
    name	     => $apache_name,
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

  file { $www:
    ensure  => present,
    source  => 'puppet:///modules/php/index.php',
    require => Package[apache],
    notify  => Service[apache-service],
  }

}
