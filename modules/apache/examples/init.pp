$adminemail = 'puppetclient@example.com'
$servername = 'puppetclient.example.com'

include apache
include apache::vhosts

#puppetlabs-firewall module is needed to set up firewall on the server
#https://forge.puppet.com/puppetlabs/firewall
include firewall
