class apache::vhosts {

  if $::osfamily == 'RedHat' {
   file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rh.conf.erb'),
    }
    file { "/var/www":
      ensure    => directory,
    }
    file { "/var/www/html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/logs":
      ensure    => directory,
    }
  }

  elsif $::osfamily == 'Debian' {
   file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { "/var/www":
      ensure    => directory,
    }
    file { "/var/www/html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/logs":
      ensure    => directory,
    }
  }

  else {
      fail('Unsupported Linux Distribution')
  }

}
