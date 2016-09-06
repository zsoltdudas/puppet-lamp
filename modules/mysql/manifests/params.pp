class mysql::params {

  $mysqlpassword = "Passw0rd"

  if $::osfamily == 'RedHat' {
    $mysql_name     = ['mysql-server', 'mysql', 'mysql-devel']
    $mysql_service  = 'mysqld'
    $conffile       = '/etc/my.cnf'
    $confsource     = 'puppet:///modules/mysql/my-centos.cnf'
    $init_cmd       = '/bin/true'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  elsif $::osfamily == 'Debian' {
    $mysql_name     = ['mysql-server', 'libapache2-mod-auth-mysql']
    $mysql_service  = 'mysql'
    $conffile       = '/etc/mysql/my.cnf'
    $confsource     = 'puppet:///modules/mysql/my-ubuntu.cnf'
    $init_cmd       = '/sbin/initctl reload-configuration'
    $mysqlpwd_cmd   = '/usr/bin/mysqladmin -u root password $mysqlpassword || /bin/true'
  }

  else {
    print "This is not a supported distro."
  }

}

