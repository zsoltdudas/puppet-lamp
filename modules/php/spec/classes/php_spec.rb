require 'spec_helper'

describe 'php', :type => 'class' do

  context "On Ubuntu it should contain" do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    it {
      should contain_package('php').with( { 'name' => 'php5' } )
      should contain_package('php-pear')
    }
  end

  context "On CentOS it should contain" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it {
      should contain_package('php').with( { 'name' => 'php' } )
      should contain_package('php-pear')
    }
  end

  context "On an unknown Linux distro" do
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end

