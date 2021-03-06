class mysql::params {

  $mysqlpassword = "Passw0rd"

  if $::osfamily == 'RedHat' {
    if $::operatingsystemmajrelease == '7' {
      $mysql_name     = 'mariadb-server'
      $mysql_service  = 'mariadb'
      $mysql_src      = 'puppet:///modules/mysql/my-centos.cnf'
    }

    elsif $::operatingsystemmajrelease == '6' {
      $mysql_name     = 'mysql-server'
      $mysql_service  = 'mysqld'
      $mysql_src      = 'puppet:///modules/mysql/my-centos6.cnf'
    }

    $mysql_conf     = '/etc/my.cnf'
    $init_cmd       = '/bin/true'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  elsif $::osfamily == 'Debian' {
    $mysql_name     = 'mysql-server'
    $mysql_service  = 'mysql'
    $mysql_conf     = '/etc/mysql/my.cnf'
    $mysql_src      = 'puppet:///modules/mysql/my-ubuntu.cnf'
    $init_cmd       = '/sbin/initctl reload-configuration'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  else {
    fail('Unsupported Linux Distribution')
  }

}
