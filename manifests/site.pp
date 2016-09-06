node 'puppetclient.example.com' {
  $adminemail = 'puppetmaster@example.com'
  $servername = 'puppetmaster.example.com'

  include apache
  include apache::vhosts
  include mysql
  include php
}

node 'puppetcentos.example.com' {
  $adminemail = 'puppetmaster@example.com'
  $servername = 'puppetmaster.example.com'

  include apache
  include apache::vhosts
  include mysql
  include php
}
