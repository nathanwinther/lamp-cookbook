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
  initial_root_password node['lamp']['database_root_pass']
  action [:create, :start]
end

