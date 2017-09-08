require 'spec_helper'

RSpec.describe Vindi::Client::Transaction do
  let(:client) { basic_auth_client }

  describe 'list_transactions' do
    it 'returns a collection of transactions' do
      VCR.use_cassette("rest/transactions/list_transactions") do
        list_transactions_response = client.list_transactions
        assert_requested :get, vindi_url("transactions")
        expect(list_transactions_response).to be_kind_of(Array)
      end
    end
  end

  describe 'transaction' do
    it 'returns a transaction from vindi' do
      VCR.use_cassette("rest/transactions/transaction") do
        transaction_response = client.transaction(498)
        assert_requested :get, vindi_url("transactions/498")
        expect(transaction_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_transaction' do
    it 'returns the newly created transaction' do
      VCR.use_cassette("rest/transactions/create_transaction") do
        transaction_attributes = { charge_id: 457, amount: 100,
                                   payment_method_code: 'cash',
                                   paid_at: '2017-09-08' }

        transaction_response = client.create_transaction(transaction_attributes)
        assert_requested :post, vindi_url("transactions")
        expect(transaction_response[:status]).to eq('success')
      end
    end
  end
end
