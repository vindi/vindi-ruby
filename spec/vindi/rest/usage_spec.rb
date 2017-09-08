require 'spec_helper'

RSpec.describe Vindi::Client::Usage do
  let(:client) { basic_auth_client }

  describe 'create_usage' do
    it 'returns the newly created usage' do
      VCR.use_cassette("rest/usages/create_usage") do
        usage_attributes = { period_id: 382, product_item_id: 141, quantity: 3 }

        usage_response = client.create_usage(usage_attributes)
        assert_requested :post, vindi_url("usages")
        expect(usage_response[:quantity]).to eq(3)
      end
    end
  end

  describe 'delete_usage' do
    it 'returns the deleted usage' do
      VCR.use_cassette("rest/usages/delete_usage") do
        usage_response = client.delete_usage(652)
        assert_requested :delete, vindi_url("usages/652")
        expect(usage_response).to be_kind_of(Hash)
      end
    end
  end
end
