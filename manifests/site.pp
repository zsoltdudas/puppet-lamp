node 'puppetclient.example.com' {
  $adminemail = 'puppetmaster@example.com'
  $servername = 'puppetmaster.example.com'

  include accounts
  include apache
  include apache::vhosts
  include mysql
  include php

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before        => Class['firewall::post'],
    require       => Class['firewall::pre'],
  }

  class { ['firewall::pre', 'firewall::post']: }

  }

node 'puppetcentos.example.com' {
  $adminemail = 'puppetmaster@example.com'
  $servername = 'puppetmaster.example.com'

  include accounts
  include apache
  include apache::vhosts
  include mysql
  include php

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before        => Class['firewall::post'],
    require       => Class['firewall::pre'],
  }

  class { ['firewall::pre', 'firewall::post']: }

  }
