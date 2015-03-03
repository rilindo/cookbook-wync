#
# Cookbook Name:: wync
# Recipe:: default
#
# Copyright (C) 2015 Rilindo Foster
#

case node["platform"]
when "ubuntu", "debian"
  dpkg_package 'wync' do
    source node['wync']['download_url']
    action :install
  end
when "redhat", "amazon", "scientific", "centos", "suse"  
  yum_package 'wync' do
    source node['wync']['download_url']
    action :install
  end
else
  log "Unknown OS"
end
