require 'spec_helper'

RSpec.describe Vindi::Client::Charge do
  let(:client) { basic_auth_client }

  describe 'list_charges' do
    it 'returns a collection of charges' do
      VCR.use_cassette("rest/charges/list_charges") do
        list_charges_response = client.list_charges
        assert_requested :get, vindi_url("charges")
        expect(list_charges_response).to be_kind_of(Array)
      end
    end
  end

  describe 'charge' do
    it 'returns a charge from vindi' do
      VCR.use_cassette("rest/charges/charge") do
        charge_response = client.charge(71)
        assert_requested :get, vindi_url("charges/71")
        expect(charge_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'reissue_charge' do
    it 'returns a charge from vindi' do
      VCR.use_cassette("rest/charges/reissue") do
        charge_attributes = { payment_method_code: "debit_card" }
        charge_response = client.reissue_charge(447, charge_attributes)
        assert_requested :post, vindi_url("charges/447/reissue")
        expect(charge_response[:status]).to eq('pending')
      end
    end
  end

  describe 'refund_charge' do
    it 'returns a charge with amount updated from vindi' do
      VCR.use_cassette("rest/charges/refund_charge") do
        charge_attributes = { amount: 10 }
        charge_response = client.refund_charge(513, charge_attributes)
        assert_requested :post, vindi_url("charges/513/refund")
        expect(charge_response[:last_transaction][:amount]).to eq("10.0")
      end
    end
  end

  describe 'update_charge' do
    it 'returns the updated charge' do
      VCR.use_cassette("rest/charges/update_charge") do
        charge_attributes = { installments: 2 }
        charge_response = client.update_charge(71, charge_attributes)
        assert_requested :put, vindi_url("charges/71")
        expect(charge_response[:installments]).to eq(2)
      end
    end
  end

  describe 'delete_charge' do
    it 'returns the deleted charge' do
      VCR.use_cassette("rest/charges/delete_charge") do
        charge_response = client.delete_charge(71)
        assert_requested :delete, vindi_url("charges/71")
        expect(charge_response).to be_kind_of(Hash)
      end
    end
  end
end
