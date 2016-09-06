class mysql::params {

  $mysqlpassword = "Passw0rd"
  $mysql_name     = 'mysql-server'

  if $::osfamily == 'RedHat' {
    $mysql_service  = 'mysqld'
    $mysql_conf       = '/etc/my.cnf'
    $mysql_src     = 'puppet:///modules/mysql/my-centos.cnf'
    $init_cmd       = '/bin/true'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  elsif $::osfamily == 'Debian' {
    $mysql_service  = 'mysql'
    $mysql_conf       = '/etc/mysql/my.cnf'
    $mysql_src     = 'puppet:///modules/mysql/my-ubuntu.cnf'
    $init_cmd       = '/sbin/initctl reload-configuration'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  else {
    print "This is not a supported distro."
  }

}
