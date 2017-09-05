require 'spec_helper'

RSpec.describe Vindi::Client::ProductItem do
  let(:client) { basic_auth_client }

  describe 'product_item' do
    it 'returns a product_item from vindi' do
      VCR.use_cassette("rest/product_items/product_item") do
        product_item_response = client.product_item(131)
        assert_requested :get, vindi_url("product_items/131")
        expect(product_item_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_product_item' do
    it 'returns the newly created product_item' do
      VCR.use_cassette("rest/product_items/create_product_item") do
        product_item_attributes = { product_id: 26, quantity: 1 }

        product_item_response = client.create_product_item(product_item_attributes)
        assert_requested :post, vindi_url("product_items")
        expect(product_item_response[:status]).to eq('active')
      end
    end
  end

  describe 'update_product_item' do
    it 'returns the updated product_item' do
      VCR.use_cassette("rest/product_items/update_product_item") do
        product_item_attributes = { cycles: 2 }
        product_item_response = client.update_product_item(130, product_item_attributes)
        assert_requested :put, vindi_url("product_items/130")
        expect(product_item_response[:cycles]).to eq(2)
      end
    end
  end

  describe 'delete_product_item' do
    it 'returns the deleted product_item' do
      VCR.use_cassette("rest/product_items/delete_product_item") do
        product_item_response = client.delete_product_item(131)
        assert_requested :delete, vindi_url("product_items/131")
        expect(product_item_response[:status]).to eq('deleted')
      end
    end
  end
end
