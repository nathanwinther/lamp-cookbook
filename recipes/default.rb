#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'lamp::firewall'
include_recipe 'lamp::webadmin'
include_recipe 'lamp::web'
include_recipe 'lamp::database'

