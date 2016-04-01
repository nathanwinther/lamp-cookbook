#
# Cookbook Name:: lamp
# Recipe:: webadmin
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group node['lamp']['webadmin']['user'] do
  action :create
end

user node['lamp']['webadmin']['user'] do
  group node['lamp']['webadmin']['user']
  system true
  shell '/bin/bash'
end

