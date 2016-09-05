class mysql (
  $mysqlname    = $::mysql::params::mysqlname,
  $conffile     = $::mysql::params::conffile,
  $confsource   = $::mysql::params::confsource,
) inherits ::apache::params {

  package { 'mysql':
    name    => $mysqlname,
    ensure  => present,
  }
 
  service { $mysql_service:
    ensure    => running,
    enable    => true,
    require   => Package[$mysql], 
  }

  file { $mysql_conf:
    ensure  => present,
    source  => "puppet:///modules/lamp/mysql/my.${operatingsystem}.cnf",
    require => Package[$mysql],
    notify  => Service[$mysql_srv],
  }

  exec { 'initcommand':
    command => $init_cmd,
    require => Service[$mysql_srv],
  }

  exec { 'mysql_password':
    command => $mysqlpw_cmd,
    onlyif  => $init_cmd,
    require => Package[$apache],
  }
