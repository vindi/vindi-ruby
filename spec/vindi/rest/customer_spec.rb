require 'spec_helper'

RSpec.describe Vindi::Client::Customer do
  let(:client) { basic_auth_client }

  describe 'list_customers' do
    it 'returns a collection of customers' do
      VCR.use_cassette("rest/customers/list_customers") do
        list_customers_response = client.list_customers
        assert_requested :get, vindi_url("customers")
        expect(list_customers_response[:customers]).to be_kind_of(Array)
      end
    end
  end

  describe 'customer' do
    it 'returns a customer from vindi' do
      VCR.use_cassette("rest/customers/customer") do
        customer_response = client.customer(15)
        assert_requested :get, vindi_url("customers/15")
        expect(customer_response[:customer]).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_customer' do
    it 'returns the newly created customer' do
      VCR.use_cassette("rest/customers/create_customer") do
        customer_attributes = { name: 'Jane Doe' }

        customer_response = client.create_customer(customer_attributes)
        assert_requested :post, vindi_url("customers")
        expect(customer_response[:customer][:name]).to eq('Jane Doe')
      end
    end
  end

  describe 'update_customer' do
    it 'returns the updated customer' do
      VCR.use_cassette("rest/customers/update_customer") do
        customer_attributes = { name: 'Johana Doe' }
        customer_response = client.update_customer(15, customer_attributes)
        assert_requested :put, vindi_url("customers/15")
        expect(customer_response[:customer][:name]).to eq('Johana Doe')
      end
    end
  end

  describe 'delete_customer' do
    it 'returns the deleted customer' do
      VCR.use_cassette("rest/customers/delete_customer") do
        customer_response = client.delete_customer(15)
        assert_requested :delete, vindi_url("customers/15")
        expect(customer_response[:customer][:name]).to eq('Johana Doe')
      end
    end
  end
end
