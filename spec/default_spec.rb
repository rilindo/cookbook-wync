require 'chefspec'

describe 'wync::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
        :platform => 'debian',
        :version => '7.0'
    ).converge(described_recipe)
  end

  shared_examples_for 'all platforms' do
    it 'includes the wync package' do
      expect(chef_run).to include_recipe('wync::default')
    end
  end

  shared_examples_for 'package resource' do
    it 'installs the wync package' do
      expect(chef_run).to install_package('wync')
    end
  end

  context 'default attributes' do
    it_behaves_like 'all platforms'
    it_behaves_like 'package resource'
  end

  context 'debian platform family' do
    context 'default attributes' do
      it_behaves_like 'all platforms'
      it_behaves_like 'package resource'
    end
  end

  context 'rhel platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'redhat',
          :version => '6.5'
      ).converge(described_recipe)
    end

    context 'default attributes' do
      it_behaves_like 'all platforms'
      it_behaves_like 'package resource'
    end
  end

  context 'ubuntu platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'ubuntu',
          :version => '14.04'
      ).converge(described_recipe)
    end

    context 'default attributes' do
      it_behaves_like 'all platforms'
      it_behaves_like 'package resource'
    end
  end

  context 'ubuntu platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
          :platform => 'suse',
          :version => '11.3'
      ).converge(described_recipe)
    end

    context 'default attributes' do
      it_behaves_like 'all platforms'
      it_behaves_like 'package resource'
    end
  end
end
