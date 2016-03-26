# Chef LAMP cookbook

Chef LAMP cookbook for Vagrant development

## PHP modules

````
php5-apcu
php5-curl
php5-gd
php5-mcrypt
php5-xmlrpc
php5-xsl
````

## Dependent cookbooks

````
depends 'apt', '~> 3.0.0'
depends 'firewall', '~> 2.5.0'
depends 'httpd', '~> 0.3.5'
depends 'mysql2_chef_gem', '~> 1.0.2'
depends 'mysql', '~> 6.1.3'
depends 'database', '~> 5.0.0'
````

