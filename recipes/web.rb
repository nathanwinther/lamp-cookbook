#
# Cookbook Name:: lamp
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install Apache and start the service.
httpd_service 'site' do
  listen_ports node['lamp']['web_listen_ports']
  mpm 'prefork'
  run_user node['lamp']['web_run_user']
  run_group node['lamp']['web_run_group']
  action [:create, :start]
end

# Apache modules
httpd_module 'php5' do
  instance 'site'
  action :create
end
httpd_module 'rewrite' do
  instance 'site'
  action :create
end
httpd_module 'ssl' do
  instance 'site'
  action :create
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'httpd_service[site]'
end

# PHP modules
package 'php5-apcu' do
  action :install
  notifies :restart, 'httpd_service[site]'
end
package 'php5-curl' do
  action :install
  notifies :restart, 'httpd_service[site]'
end
package 'php5-gd' do
  action :install
  notifies :restart, 'httpd_service[site]'
end
package 'php5-mcrypt' do
  action :install
  notifies :restart, 'httpd_service[site]'
end
# This shouldn't be required, but is...
execute 'php5enmod-mcrypt' do
  command 'php5enmod mcrypt'
  action :run
  notifies :restart, 'httpd_service[site]'
end
package 'php5-xmlrpc' do
  action :install
  notifies :restart, 'httpd_service[site]'
end
package 'php5-xsl' do
  action :install
  notifies :restart, 'httpd_service[site]'
end

