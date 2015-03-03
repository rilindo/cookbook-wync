case node['platform_family']
when 'debian'
  default['wync']['download_url'] = 'http://fisil.com/linux/wync_debian64_v2.0.257.deb'
when 'ubuntu'
  default['wync']['download_url'] = 'http://fisil.com/linux/wync_ubuntu64_v2.0.294.deb'
when 'ubuntu'
  default['wync']['download_url'] = 'http://fisil.com/linux/wync_suse64_v2.0.294.rpm'
else
  default['wync']['download_url'] = 'http://fisil.com/linux/wync_redhat64_v2.0.294.rpm'
end
