name             'wync'
maintainer       'Rilindo Foster'
maintainer_email 'rilindo.foster@monzell.com'
license          'All rights reserved'
description      'Installs/Configures wync'
long_description 'Installs/Configures wync'
version          '0.1.3'
%w{ ubuntu debian redhat centos suse }.each do |os|
supports os
end
