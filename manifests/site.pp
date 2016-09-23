#Please fill this out with the nodes fqdn and email address
node 'puppetclient.example.com' {
  $adminemail = 'puppetclient@example.com'
  $servername = 'puppetclient.example.com'

  include apache
  include apache::vhosts
  include mysql
  include php

  #puppetlabs-firewall module is needed to set up firewall on the server
  #https://forge.puppet.com/puppetlabs/firewall
  include firewall
}
