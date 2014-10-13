#! /usr/bin/env ruby

require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask('Enter sudo password: ') { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end

  c.before :suite do

    `apt-get install -y curl`

    File.open('/etc/hosts', 'w+') do |f|
      f.puts '127.0.0.1 default-ubuntu-1404 localhost www.example.com'
      f.puts '::1     default-ubuntu-1404 localhost ip6-localhost ip6-loopback www.example.com'
    end

  end
end
