#! /usr/bin/env ruby
#
# Cookbook Name:: chef_testing_example
# Recipe:: default
#
#
package 'apache2'

service 'apache2' do
  action [:start,:enable]
end

execute 'a2enmod rewrite' do
  not_if 'test -f /etc/apache2/mods-enabled/rewrite.load'
end

template '/etc/apache2/sites-available/default_example.conf' do
  source 'default_example.conf.erb'
  variables(
    hostname: node['chef_testing_example']['hostname']
  )
  notifies :restart, 'service[apache2]', :delayed
end

execute 'a2ensite default_example.conf' do
  not_if 'test -f /etc/apache2/sites-enabled/default_example.conf'
end
