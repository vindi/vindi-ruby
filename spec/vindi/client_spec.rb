require 'spec_helper'

RSpec.describe Vindi::Client do
  let(:options) { { key: 'xDw3elPwddlzqgFzJqZXkiy-jZlzVvY7L1aVdcDbMHg',
                    default_media_type: 'application/vnd.api+json' } }

  let(:client) { basic_auth_client }

  context 'initialization' do
    describe 'when initialize a new client' do
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
        token = 'eER3M2VsUHdkZGx6cWdGekpxWlhraXktalpselZ2WTdMMWFWZGNEYk1IZzo='

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
      it 'retuns not found error' do
        VCR.use_cassette("raise_404_error") do
          expect{ client.get 'hello' }
            .to raise_error Vindi::Error::NotFound
        end
      end
    end
  end
end
