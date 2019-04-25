require 'spec_helper'

RSpec.describe Vindi::Client::Discount do
  let(:client) { basic_auth_client }

  describe 'discount' do
    it 'returns a discount from vindi' do
      VCR.use_cassette("rest/discounts/discount") do
        discount_response = client.discount(13318)
        assert_requested :get, vindi_url("discounts/13318")
        expect(discount_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_discount' do
    it 'returns the newly created discount' do
      VCR.use_cassette("rest/discounts/create_discount") do
        discount_attributes = { product_item_id: 104977,
                                discount_type: "percentage", percentage: 10,
                                amount: 1, quantity: 1, cycles: 1 }

        discount_response = client.create_discount(discount_attributes)
        assert_requested :post, vindi_url("discounts")
        expect(discount_response[:percentage]).to eq('10.0')
      end
    end
  end

  describe 'delete_discount' do
    it 'returns the deleted discount' do
      VCR.use_cassette("rest/discounts/delete_discount") do
        discount_response = client.delete_discount(13318)
        assert_requested :delete, vindi_url("discounts/13318")
        expect(discount_response[:percentage]).to eq('10.0')
      end
    end
  end
end
