require 'spec_helper'

RSpec.describe Vindi::Client::BillItem do
  let(:client) { basic_auth_client }

  describe 'bill_item' do
    it 'returns a bill_item from vindi' do
      VCR.use_cassette("rest/bill_items/bill_item") do
        bill_item_response = client.bill_item(133)
        assert_requested :get, vindi_url("bill_items/133")
        expect(bill_item_response).to be_kind_of(Hash)
      end
    end
  end
end
