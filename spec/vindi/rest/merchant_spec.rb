require 'spec_helper'

RSpec.describe Vindi::Client::Merchant do
  let(:client) { basic_auth_client("T9qEAJ7vIU9Unj0vmiZFDVjywt2Vn-MhYHcjrjwB6n0") }

  describe 'list_merchants' do
    it 'returns a collection of merchants' do
      VCR.use_cassette("rest/merchants/list_merchants") do
        list_merchants_response = client.list_merchants
        assert_requested :get, vindi_url("merchants")
        expect(list_merchants_response).to be_kind_of(Array)
      end
    end
  end

  describe 'merchant' do
    it 'returns a merchant from vindi' do
      VCR.use_cassette("rest/merchants/merchant") do
        merchant_response = client.merchant(17)
        assert_requested :get, vindi_url("merchants/17")
        expect(merchant_response).to be_kind_of(Hash)
      end
    end
  end

  it 'returns a current merchant' do
    VCR.use_cassette("rest/merchants/current_merchant") do
      merchant_response = client.current_merchant
      assert_requested :get, vindi_url("merchants/current")
      expect(merchant_response).to be_kind_of(Hash)
    end
  end
end
