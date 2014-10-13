require 'spec_helper'

describe 'Chef Testing Example Server' do

  describe port 80 do
    it { should be_listening }
  end

  describe service 'apache2' do
    it { should be_running }
    it { should be_enabled }
  end

  describe command 'curl -q -I http://www.example.com' do
    its(:stdout) { should match '302 Found' }
    its(:stdout) { should match 'https://docs.getchef.com/kitchen.html' }
  end

end
