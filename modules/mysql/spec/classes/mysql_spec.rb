require 'spec_helper'

describe 'mysql', :type => 'class' do

  context "On Ubuntu it should contain" do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    it {
      should contain_package('mysql').with( { 'name' => 'mysql-server' } )
      should contain_service('mysql-service').with({ 'name' => 'mysql' })
      should contain_file('mysql-conf').with_path('/etc/mysql/my.cnf')
    }
  end

  context "On CentOS it should contain" do
    let :facts do
      {
        :osfamily => 'RedHat',
        :operatingsystemmajrelease => '7'
      }
    end

    it {
      should contain_package('mysql').with( { 'name' => 'mariadb-server' } )
      should contain_service('mysql-service').with({ 'name' => 'mariadb' })
      should contain_file('mysql-conf').with_path('/etc/my.cnf')
    }
  end

  context "On CentOS it should contain" do
    let :facts do
      {
        :osfamily => 'RedHat',
        :operatingsystemmajrelease => '6'
      }
    end

    it {
      should contain_package('mysql').with( { 'name' => 'mysql-server' } )
      should contain_service('mysql-service').with({ 'name' => 'mysqld' })
      should contain_file('mysql-conf').with_path('/etc/my.cnf')
    }
  end

  context "On an unknown Linux distro" do
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
