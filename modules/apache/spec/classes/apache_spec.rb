require 'spec_helper'

describe 'apache', :type => 'class' do

  context "On a Debian OS with no package name specified" do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    it {
      should contain_package('apache').with( { 'name' => 'apache2' } )
      should contain_service('apache-service').with( { 'name' => 'apache2' } )
    }
  end

  context "On a RedHat OS with no package name specified" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it {
      should contain_package('apache').with( { 'name' => 'httpd' } )
      should contain_service('apache-service').with( { 'name' => 'httpd' } )
    }
  end

  context "On an unknown OS with no package name specified" do
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
