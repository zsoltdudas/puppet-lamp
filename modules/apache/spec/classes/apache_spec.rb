require 'spec_helper'

describe 'apache', :type => 'class' do

  context "On Ubuntu it should contain" do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    it {
      should contain_package('apache').with( { 'name' => 'apache2' } )
      should contain_service('apache-service').with( { 'name' => 'apache2' } )
      should contain_file('configuration-file').with_path('/etc/apache2/apache2.conf')
    }
  end

  context "On CentOS it should contain" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it {
      should contain_package('apache').with( { 'name' => 'httpd' } )
      should contain_service('apache-service').with( { 'name' => 'httpd' } )
      should contain_file('configuration-file').with_path('/etc/httpd/conf/httpd.conf')
    }
  end

  context "On an unknown Linux distro" do
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
