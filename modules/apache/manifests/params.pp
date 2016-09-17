class apache::params {

  if $::osfamily     == 'RedHat' {
    $apache_name     = 'httpd'
    $conffile        = '/etc/httpd/conf/httpd.conf'
    $confsource      = 'puppet:///modules/apache/httpd.conf'
    $www             = '/var/www/html/index.php'
  }

  elsif $::osfamily  == 'Debian' {
    $apache_name     = 'apache2'
    $conffile        = '/etc/apache2/apache2.conf'
    $confsource      = 'puppet:///modules/apache/apache2.conf'
    $www             = '/var/www/html/index.php'
  }

  else {
    print "This is not a supported distro."
  }

}
