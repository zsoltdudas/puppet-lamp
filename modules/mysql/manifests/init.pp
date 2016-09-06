class mysql (
  $mysql_name    = $::mysql::params::mysql_name,
  $mysql_service = $::mysql::params::mysql_service,
  $conffile      = $::mysql::params::conffile,
  $confsource    = $::mysql::params::confsource,
  $init_cmd      = $::mysql::params::init_cmd,
  $mysqlpwd_cmd  = $::mysql::params::mysqlpwd_cmd,
) inherits ::mysql::params {

  package { 'mysql':
    name    => $mysql_name,
    ensure  => present,
  }

  service { $mysql_service:
    ensure    => running,
    enable    => true,
    require   => Package['mysql'],
  }

  file { 'configuration-file':
    path    => $conffile,
    ensure  => file,
    source  => $confsource,
    require => Package['mysql'],
    notify  => Service[$mysql_service],
  }

  exec { 'init_cmd':
    command => $init_cmd,
    require => Service[$mysql_service],
  }

  exec { 'mysql_password':
    command => $mysqlpwd_cmd,
    onlyif  => $init_cmd,
    require => Package[$mysql_service],
  }
