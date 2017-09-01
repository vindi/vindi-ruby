require 'simplecov'
SimpleCov.start

require 'vindi'  
require 'rspec'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes/vindi"
  config.hook_into :webmock
end

RSpec.configure do |config|
end

def stub_post(url)
  stub_request(:post, vindi_url(url))
end

def stub_get(url)
  stub_request(:get, vindi_url(url))
end

def vindi_url(url)
  return url if url =~ /^https/
  url.prepend(Vindi::Default.api_endpoint)
end
