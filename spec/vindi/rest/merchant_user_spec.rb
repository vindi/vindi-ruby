require 'spec_helper'

RSpec.describe Vindi::Client::MerchantUser do
  let(:client) { basic_auth_client }

  describe 'list_merchant_users' do
    it 'returns a collection of merchant_users' do
      VCR.use_cassette("rest/merchant_users/list_merchant_users") do
        list_merchant_users_response = client.list_merchant_users
        assert_requested :get, vindi_url("merchant_users")
        expect(list_merchant_users_response).to be_kind_of(Array)
      end
    end
  end

  describe 'merchant_user' do
    it 'returns a merchant_user from vindi' do
      VCR.use_cassette("rest/merchant_users/merchant_user") do
        merchant_user_response = client.merchant_user(38)
        assert_requested :get, vindi_url("merchant_users/38")
        expect(merchant_user_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_merchant_user' do
    it 'returns the newly created merchant_user' do
      VCR.use_cassette("rest/merchant_users/create_merchant_user") do
        merchant_user_attributes = { name: 'Jane Doe', email: "janedoe@teste.com",
                                     role_id: 10 }

        merchant_user_response = client.create_merchant_user(merchant_user_attributes)
        assert_requested :post, vindi_url("merchant_users")
        expect(merchant_user_response[:user][:name]).to eq('Jane Doe')
      end
    end
  end

  describe 'update_merchant_user' do
    it 'returns the updated merchant_user' do
      VCR.use_cassette("rest/merchant_users/update_merchant_user") do
        merchant_user_attributes = { role_id: 7 }
        merchant_user_response = client.update_merchant_user(39, merchant_user_attributes)
        assert_requested :put, vindi_url("merchant_users/39")
        expect(merchant_user_response[:role][:id]).to eq(7)
      end
    end
  end

  describe 'delete_merchant_user' do
    it 'returns the deleted merchant_user' do
      VCR.use_cassette("rest/merchant_users/delete_merchant_user") do
        merchant_user_response = client.delete_merchant_user(39)
        assert_requested :delete, vindi_url("merchant_users/39")
        expect(merchant_user_response[:user][:name]).to eq('Joana Doe')
      end
    end
  end

  describe 'reactivate merchant_user' do
    it 'reactivate the merchant_user' do
      VCR.use_cassette("rest/merchant_users/reactivate_merchant_user") do
        merchant_user_response = client.reactivate_merchant_user(39)
        assert_requested :post, vindi_url("merchant_users/39/reactivate")
        expect(merchant_user_response[:status]).to eq("active")
      end
    end
  end
end
