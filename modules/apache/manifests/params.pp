class apache::params {

  if $::osfamily     == 'RedHat' {
    if $::operatingsystemmajrelease == '7' {
      $confsource = 'puppet:///modules/apache/httpd.conf'
    }

    elsif $::operatingsystemmajrelease == '6' {
      $confsource = 'puppet:///modules/apache/httpd-centos6.conf'
    }
    $apache_name     = 'httpd'
    $conffile        = '/etc/httpd/conf/httpd.conf'
    $www             = '/var/www/html/index.php'
  }

  elsif $::osfamily  == 'Debian' {
    $apache_name     = 'apache2'
    $conffile        = '/etc/apache2/apache2.conf'
    $confsource      = 'puppet:///modules/apache/apache2.conf'
    $www             = '/var/www/html/index.php'
  }

  else {
    fail('Unsupported Linux Distribution')
  }

}
