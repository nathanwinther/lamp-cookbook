#
# Cookbook Name:: lamp
# Recipe:: remoteuser
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Get connection info
mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => node['lamp']['database_root_pass']
}

# Create remote user
mysql_database_user 'root' do
  connection mysql_connection_info
  password node['lamp']['database_root_pass']
  host '%'
  action :create
  only_if { node['lamp']['remoteuser'] }
end

# Run once
directory node['lamp']['run_once'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  only_if { node['lamp']['remoteuser'] }
end

file node['lamp']['run_once'] + '/database-remote-root-user' do
  action :create_if_missing
  notifies :query, 'mysql_database[remote_root_user]', :immediately
  notifies :query, 'mysql_database[flush_privileges]', :immediately
  only_if { node['lamp']['remoteuser'] }
end
    
# Grant remote user
mysql_database 'remote_root_user' do
  connection mysql_connection_info
  database_name 'mysql'
  sql "GRANT ALL PRIVILEGES ON * . * TO 'root'@'%'"
  action :nothing
  notifies :restart, 'mysql_service[site]'
end

mysql_database 'flush_privileges' do
  connection mysql_connection_info
  database_name 'mysql'
  sql "FLUSH PRIVILEGES"
  action :nothing
  notifies :restart, 'mysql_service[site]'
end

