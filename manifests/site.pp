#Please fill this out with the nodes fqdn and email address
node 'puppetclient.example.com' {
  $adminemail = 'puppetclient@example.com'
  $servername = 'puppetclient.example.com'

  include apache
  include apache::vhosts
  include mysql
  include php
  include firewall
}
