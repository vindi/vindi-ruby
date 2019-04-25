require 'simplecov'
SimpleCov.start

VINDI_SANDBOX_ENDPOINT = "https://sandbox-app.vindi.com.br/api/v1/".freeze

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
  url.prepend(VINDI_SANDBOX_ENDPOINT)
end

def test_key
  'T9qEAJ7vIU9Unj0vmiZFDVjywt2Vn-MhYHcjrjwB6n0'
end

def basic_auth_client(key = test_key)
  Vindi::Client.new(key: key, api_endpoint: VINDI_SANDBOX_ENDPOINT)
end
