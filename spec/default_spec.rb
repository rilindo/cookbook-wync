require 'chefspec'

describe 'wync::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
        :platform => 'debian',
        :version => '7.0',
        :file_cache_path => '/var/chef/cache'
    ).converge(described_recipe)
  end

  it 'includes the wync recipe' do
    expect(chef_run).to include_recipe('wync::default')
  end

  it 'creates a remote_file with the default action' do
     expect(chef_run).to create_remote_file('/var/chef/cache/wync_debian64_v2.0.257.deb')
  end

  it 'installs the wync package' do
    expect(chef_run).to install_dpkg_package('wync')
  end

  context 'rhel platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'redhat',
          :version => '6.5',
	  :file_cache_path => '/var/chef/cache'
      ).converge(described_recipe)
    end

    it 'includes the wync recipe' do
      expect(chef_run).to include_recipe('wync::default')
    end


    it 'creates a remote_file with the default action' do
      expect(chef_run).to create_remote_file('/var/chef/cache/wync_redhat64_v2.0.302.rpm')
    end

    it 'installs the wync package' do
      expect(chef_run).to install_yum_package('wync')
    end

  end

  context 'suse platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'suse',
          :version => '11.3',
	  :file_cache_path => '/var/chef/cache'
      ).converge(described_recipe)
    end

    it 'includes the wync recipe' do
      expect(chef_run).to include_recipe('wync::default')
    end

    it 'creates a remote_file with the default action' do
      expect(chef_run).to create_remote_file('/var/chef/cache/wync_suse64_v2.0.301.rpm')
    end


    it 'installs the wync package' do
      expect(chef_run).to install_yum_package('wync')
    end
  end

  context 'ubuntu platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'ubuntu',
          :version => '14.04',
	  :file_cache_path => '/var/chef/cache'
      ).converge(described_recipe)
    end

    it 'includes the wync recipe' do
      expect(chef_run).to include_recipe('wync::default')
    end

    it 'creates a remote_file with the default action' do
      expect(chef_run).to create_remote_file('/var/chef/cache/wync_ubuntu64_v2.0.302.deb')
    end

    it 'installs the wync package' do
      expect(chef_run).to install_dpkg_package('wync')
    end
  end

end
