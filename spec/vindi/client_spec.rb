require 'spec_helper'

RSpec.describe Vindi::Client do
  let(:options) do 
    {
      key: 'xDw3elPwddlzqgFzJqZXkiy-jZlzVvY7L1aVdcDbMHg', 
      default_media_type: 'application/json'
    }
  end
  let(:client) { Vindi::Client.new(options) }

  describe 'when initialize a new client' do
    it 'overrides module configuration' do
      expect(client.key).to eq(options[:key])
      expect(client.default_media_type).to eq(options[:default_media_type])
    end

    it 'can set configuration after initialization' do
      client = Vindi::Client.new 
      options.each do |key, value|
        client.instance_variable_set("@#{key}", value)
      end

      expect(client.key).to eq(options[:key])
      expect(client.default_media_type).to eq(options[:default_media_type])
    end
  end

  describe 'content type' do
    it 'sets a default Content-Type header' do
      plan_request = stub_get('plans')
        .with({ headers: {'Content-Type' => 'application/json'}})

      client.get 'plans'
      assert_requested plan_request
    end
  end
end
