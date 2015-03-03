#
# Cookbook Name:: wync
# Recipe:: default
#
# Copyright (C) 2015 Rilindo Foster
#

package 'wync' do
  source node['wync']['download_url']
  action :install
end

