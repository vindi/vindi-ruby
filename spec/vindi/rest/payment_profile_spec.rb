require 'spec_helper'

RSpec.describe Vindi::Client::PaymentProfile do
  let(:client) { basic_auth_client }

  describe 'list_payment_profiles' do
    it 'returns a collection of payment_profiles' do
      VCR.use_cassette("rest/payment_profiles/list_payment_profiles") do
        list_payment_profiles_response = client.list_payment_profiles
        assert_requested :get, vindi_url("payment_profiles")
        expect(list_payment_profiles_response).to be_kind_of(Array)
      end
    end
  end

  describe 'payment_profile' do
    it 'returns a payment_profile from vindi' do
      VCR.use_cassette("rest/payment_profiles/payment_profile") do
        payment_profile_response = client.payment_profile(18)
        assert_requested :get, vindi_url("payment_profiles/18")
        expect(payment_profile_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_payment_profile' do
    it 'returns the newly created payment_profile' do
      VCR.use_cassette("rest/payment_profiles/create_payment_profile") do
        payment_profile_attributes = { holder_name: "John Doe",
                                       card_expiration: "12/2018",
                                       card_number: "5167454851671773",
                                       card_cvv: "123",
                                       payment_method_code: "credit_card",
                                       payment_company_code: "mastercard",
                                       customer_id: 382 }

        payment_profile_response = client.create_payment_profile(payment_profile_attributes)
        assert_requested :post, vindi_url("payment_profiles")
        expect(payment_profile_response[:holder_name]).to eq('JOHN DOE')
      end
    end
  end

  describe 'delete_payment_profile' do
    it 'returns the deleted payment_profile' do
      VCR.use_cassette("rest/payment_profiles/delete_payment_profile") do
        payment_profile_response = client.delete_payment_profile(37)
        assert_requested :delete, vindi_url("payment_profiles/37")
        expect(payment_profile_response[:status]).to eq('inactive')
      end
    end
  end
end
