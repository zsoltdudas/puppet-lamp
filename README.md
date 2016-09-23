# puppet-lamp

### Introduction
This repo contains 3 puppet modules: Apache, Mysql and PHP, which can be used to deploy a LAMP stack

### Supported distributions
- Ubuntu 14
- Centos 6
- Centos 7

### Notes
In order to set up the LAMP server, we need to configure the firewall on it. We do this using puppetlabs-firewall module, which handles firewall on all supported distributions. Please download it before installing LAMP.

    puppet module install puppetlabs-firewall