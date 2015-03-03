require 'chefspec'

describe 'wync::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
        :platform => 'debian',
        :version => '7.0',
        :provider => 'dpkg_package',
    ).converge(described_recipe)
  end

  it 'includes the wync package' do
    expect(chef_run).to include_recipe('wync::default')
  end

  it 'installs the wync package' do
    expect(chef_run).to install_dpkg_package('wync')
  end

  context 'rhel platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'redhat',
          :version => '6.5'
      ).converge(described_recipe)
    end

    it 'installs the wync package' do
      expect(chef_run).to install_yum_package('wync')
    end

  end

  context 'suse platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'suse',
          :version => '11.3'
      ).converge(described_recipe)
    end

    it 'installs the wync package' do
      expect(chef_run).to install_yum_package('wync')
    end
  end

  context 'ubuntu platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'ubuntu',
          :version => '14.04'
      ).converge(described_recipe)
    end

    it 'installs the wync package' do
      expect(chef_run).to install_dpkg_package('wync')
    end
  end

end
