#! /usr/bin/env ruby

require 'spec_helper'

describe 'chef_testing_example::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before do
    stub_command('test -f /etc/apache2/mods-enabled/rewrite.load').and_return(false)
    stub_command('test -f /etc/apache2/sites-enabled/default_example.conf').and_return(false)
  end

  it 'installs apache2' do
    expect(chef_run).to install_package('apache2')
  end

  it 'starts apache2' do
    expect(chef_run).to start_service('apache2')
  end

  it 'configures apache2 to start at boot' do
    expect(chef_run).to enable_service('apache2')
  end

  it 'enables mod_rewrite' do
    expect(chef_run).to run_execute('a2enmod rewrite')
  end

  it 'creates the default_example site from template' do
    expect(chef_run).to create_template('/etc/apache2/sites-available/default_example.conf').with(
      source: 'default_example.conf.erb',
      variables: {
        hostname: 'www.example.com'
      }
    )
  end

  it 'restarts apache when changes are made to the default_example site template' do
    expect(chef_run.template('/etc/apache2/sites-available/default_example.conf')).to \
      notify('service[apache2]').to(:restart).delayed
  end

  it 'enables the default_example site' do
    expect(chef_run).to run_execute('a2ensite default_example.conf')
  end

end
