require 'spec_helper'

RSpec.describe Vindi::Client::Subscription do
  let(:client) { basic_auth_client }

  describe 'list_subscriptions' do
    it 'returns a collection of subscriptions' do
      VCR.use_cassette("rest/subscriptions/list_subscriptions") do
        list_subscriptions_response = client.list_subscriptions
        assert_requested :get, vindi_url("subscriptions")
        expect(list_subscriptions_response).to be_kind_of(Array)
      end
    end
  end

  describe 'subscription' do
    it 'returns a subscription from vindi' do
      VCR.use_cassette("rest/subscriptions/subscription") do
        subscription_response = client.subscription(64)
        assert_requested :get, vindi_url("subscriptions/64")
        expect(subscription_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_subscription' do
    it 'returns the newly created subscription' do
      VCR.use_cassette("rest/subscriptions/create_subscription") do
        subscription_attributes = { plan_id: 15, customer_id: 2,
                                    payment_method_code: "credit_card",
                                    product_items: [{ product_id: 26 }]}

        subscription_response = client.create_subscription(subscription_attributes)
        assert_requested :post, vindi_url("subscriptions")
        expect(subscription_response[:status]).to match('active')
      end
    end
  end

  describe 'update_subscription' do
    it 'returns the updated subscription' do
      VCR.use_cassette("rest/subscriptions/update_subscription") do
        subscription_attributes = { payment_method_code: 'debit_card' }
        subscription_response = client.update_subscription(64, subscription_attributes)
        assert_requested :put, vindi_url("subscriptions/64")
        expect(subscription_response[:payment_method][:code]).to eq('debit_card')
      end
    end
  end

  describe 'delete_subscription' do
    it 'returns the deleted subscription' do
      VCR.use_cassette("rest/subscriptions/delete_subscription") do
        subscription_response = client.delete_subscription(64)
        assert_requested :delete, vindi_url("subscriptions/64")
        expect(subscription_response[:status]).to match('canceled')
      end
    end
  end

  describe 'renew_subscription' do
    it 'returns the renewed subscription' do
      VCR.use_cassette("rest/subscriptions/renew_subscription") do
        subscription_response = client.renew_subscription(65)
        assert_requested :post, vindi_url("subscriptions/65/renew")
        expect(subscription_response[:status]).to match('active')
      end
    end
  end

  describe 'reactivate_subscription' do
    it 'returns the reactivated subscription' do
      VCR.use_cassette("rest/subscriptions/reactivate_subscription") do
        subscription_response = client.reactivate_subscription(61)
        assert_requested :post, vindi_url("subscriptions/61/reactivate")
        expect(subscription_response[:status]).to match('active')
      end
    end
  end
end
