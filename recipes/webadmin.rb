#
# Cookbook Name:: lamp
# Recipe:: webadmin
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group node['lamp']['webadmin']

user node['lamp']['webadmin'] do
  group node['lamp']['webadmin']
  system true
  shell '/bin/bash'
end

