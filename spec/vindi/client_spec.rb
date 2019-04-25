require 'spec_helper'

RSpec.describe Vindi::Client do
  let(:options) do
    { key: key, default_media_type: 'application/vnd.api+json' }
  end
  let(:key) { 'T9qEAJ7vIU9Unj0vmiZFDVjywt2Vn-MhYHcjrjwB6n0' }
  let(:client) { basic_auth_client }

  context 'initialization' do
    describe 'when initialize a new client with default settings' do
      it 'overrides default settings' do
        expect(client.key).to eq(options[:key])
        expect(client.default_media_type).to eq(options[:default_media_type])
      end

      it 'sets configuration after initialization' do
        options.each do |key, value|
          client.instance_variable_set("@#{key}", value)
        end

        expect(client.key).to eq(options[:key])
        expect(client.default_media_type).to eq(options[:default_media_type])
      end
    end

    describe 'when initializing a client with custom settings' do
      it 'use sandbox endpoint via class parameters' do
        api_endpoint = VINDI_SANDBOX_ENDPOINT
        sandbox_client = Vindi::Client.new(key: key, api_endpoint: api_endpoint)

        expect(sandbox_client.api_endpoint).to eq(api_endpoint)
      end

      it 'use sandbox endpoint via system variables' do
        api_endpoint = VINDI_SANDBOX_ENDPOINT
        ENV['VINDI_API_ENDPOINT'] = api_endpoint
        ENV['VINDI_KEY'] = key
        sandbox_client = Vindi::Client.new

        expect(sandbox_client.api_endpoint).to eq(api_endpoint)
        expect(sandbox_client.key).to eq(key)
      end
    end
  end

  context 'requests' do
    describe 'content type' do
      it 'sets a default Content-Type header' do

        plan_request = stub_get('plans')

        client.get 'plans'
        assert_requested plan_request
      end
    end

    describe 'authorization' do
      it 'makes a authenticated request' do
        token = 'VDlxRUFKN3ZJVTlVbmowdm1pWkZEVmp5d3QyVm4tTWhZSGNqcmp3QjZuMDo='

        root_request = stub_get('')
          .with({ headers: {'Authorization': "Basic #{token}"}})

        client.get ''
        assert_requested root_request
      end
    end

    describe 'last_response' do
      it 'caches status code' do
        expect(client.last_response).to be_nil

        VCR.use_cassette("last_response") do
          client.get 'plans'

          expect(client.last_response.status).to eq 200
        end
      end
    end

    describe 'errors' do
      it 'raises a Vindi::Error::NotFound exception' do
        VCR.use_cassette("raise_404_error") do
          expect{ client.get 'hello' }.to raise_error Vindi::Error::NotFound
        end
      end

      it 'returns an error with a 404 status code' do
        VCR.use_cassette("raise_404_error") do
          begin
            client.get 'hello'
          rescue Vindi::Error::NotFound => error
            expect(error.status_code).to eq 404
          end
        end
      end
    end
  end
end
