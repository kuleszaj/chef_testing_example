#! /usr/bin/env ruby

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|

  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '14.04'
end
