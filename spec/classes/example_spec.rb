require 'spec_helper'

describe 'observium' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "observium class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('observium::params') }
          it { is_expected.to contain_class('observium::install').that_comes_before('observium::config') }
          it { is_expected.to contain_class('observium::config') }
          it { is_expected.to contain_class('observium::service').that_subscribes_to('observium::config') }

          it { is_expected.to contain_service('observium') }
          it { is_expected.to contain_package('observium').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'observium class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('observium') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
