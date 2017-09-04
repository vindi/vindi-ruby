require 'spec_helper'

RSpec.describe Vindi::Client::PaymentMethod do
  let(:client) { basic_auth_client }

  describe 'list_payment_methods' do
    it 'returns a collection of payment_methods' do
      VCR.use_cassette("rest/payment_methods/list_payment_methods") do
        list_payment_methods_response = client.list_payment_methods
        assert_requested :get, vindi_url("payment_methods")
        expect(list_payment_methods_response).to be_kind_of(Array)
      end
    end
  end

  describe 'payment_method' do
    it 'returns a payment_method from vindi' do
      VCR.use_cassette("rest/payment_methods/payment_method") do
        payment_method_response = client.payment_method(13)
        assert_requested :get, vindi_url("payment_methods/13")
        expect(payment_method_response).to be_kind_of(Hash)
      end
    end
  end
end
