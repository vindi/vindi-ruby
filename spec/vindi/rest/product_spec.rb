require 'spec_helper'

RSpec.describe Vindi::Client::Product do
  let(:client) { basic_auth_client }

  describe 'list_products' do
    it 'returns a collection of products' do
      VCR.use_cassette("rest/products/list_products") do
        list_products_response = client.list_products
        assert_requested :get, vindi_url("products")
        expect(list_products_response).to be_kind_of(Array)
      end
    end
  end

  describe 'product' do
    it 'returns a product from vindi' do
      VCR.use_cassette("rest/products/product") do
        product_response = client.product(26)
        assert_requested :get, vindi_url("products/26")
        expect(product_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_product' do
    it 'returns the newly created product' do
      VCR.use_cassette("rest/products/create_product") do
        product_attributes = { name: 'tshirt', pricing_schema: { price: 100 } }
        product_response = client.create_product(product_attributes)
        assert_requested :post, vindi_url("products")
        expect(product_response[:name]).to eq('tshirt')
      end
    end
  end

  describe 'update_product' do
    it 'returns the updated product' do
      VCR.use_cassette("rest/products/update_product") do
        product_attributes = { name: 't-shirt', pricing_schema: { price: 100 } }
        product_response = client.update_product(26, product_attributes)
        assert_requested :put, vindi_url("products/26")
        expect(product_response[:name]).to eq('t-shirt')
      end
    end
  end
end
