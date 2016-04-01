#
# Cookbook Name:: lamp
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

mysql2_chef_gem 'site' do
  action :install
end

# Configure the MySQL client.
mysql_client 'site' do
  action :create
end

# Configure the MySQL service.
mysql_service 'site' do
  initial_root_password node['lamp']['database']['root_password']
  action [:create, :start]
end

# MySQL configuration
mysql_config 'site' do
  instance 'site'
  config_name 'extra'
  source 'extra.cnf.erb'
  action :create
  notifies :restart, 'mysql_service[site]'
end

# Get connection info
mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => node['lamp']['database']['root_password']
}

# Create remote user
mysql_database_user 'root' do
  connection mysql_connection_info
  password node['lamp']['database']['root_password']
  host '%'
  action :create
  only_if { node['lamp']['database']['root_remote'] }
end

# Run once
directory node['lamp']['run_once']['directory'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
  only_if { node['lamp']['database']['root_remote'] }
end

file node['lamp']['run_once']['directory'] + '/database_root_remote' do
  action :create_if_missing
  notifies :query, 'mysql_database[grant]', :immediately
  notifies :query, 'mysql_database[flush]', :immediately
  only_if { node['lamp']['database']['root_remote'] }
end

# Grant remote user
mysql_database 'grant' do
  connection mysql_connection_info
  database_name 'mysql'
  sql "GRANT ALL PRIVILEGES ON * . * TO 'root'@'%'"
  action :nothing
  notifies :restart, 'mysql_service[site]'
end

mysql_database 'flush' do
  connection mysql_connection_info
  database_name 'mysql'
  sql "FLUSH PRIVILEGES"
  action :nothing
  notifies :restart, 'mysql_service[site]'
end

