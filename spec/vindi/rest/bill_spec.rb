require 'spec_helper'

RSpec.describe Vindi::Client::Bill do
  let(:client) { basic_auth_client }

  describe 'list_bills' do
    it 'returns a collection of bills' do
      VCR.use_cassette("rest/bills/list_bills") do
        list_bills_response = client.list_bills
        assert_requested :get, vindi_url("bills")
        expect(list_bills_response).to be_kind_of(Array)
      end
    end
  end

  describe 'bill' do
    it 'returns a bill from vindi' do
      VCR.use_cassette("rest/bills/bill") do
        bill_response = client.bill(468)
        assert_requested :get, vindi_url("bills/468")
        expect(bill_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_bill' do
    it 'returns the newly created bill' do
      VCR.use_cassette("rest/bills/create_bill") do
        bill_attributes = { customer_id: 2, payment_method_code: "credit_card",
                            bill_items: [{ product_id: 26, amount: 1 }] }

        bill_response = client.create_bill(bill_attributes)
        assert_requested :post, vindi_url("bills")
        expect(bill_response[:amount]).to eq('1.0')
      end
    end
  end

  describe 'update_bill' do
    it 'returns the updated bill' do
      VCR.use_cassette("rest/bills/update_bill") do
        bill_attributes = { installments: 2 }
        bill_response = client.update_bill(468, bill_attributes)
        assert_requested :put, vindi_url("bills/468")
        expect(bill_response[:installments]).to eq(2)
      end
    end
  end

  describe 'approve_bill' do
    it 'returns the approved bill' do
      VCR.use_cassette("rest/bills/approve_bill") do
        bill_response = client.approve_bill(476)
        assert_requested :post, vindi_url("bills/476/approve")
        expect(bill_response[:status]).to eq('pending')
      end
    end
  end

  describe 'charge_bill' do
    it 'returns the charged bill' do
      VCR.use_cassette("rest/bills/charge_bill") do
        bill_response = client.charge_bill(479)
        assert_requested :post, vindi_url("bills/479/charge")
        expect(bill_response[:status]).to eq('pending')
      end
    end
  end

  describe 'create_invoice' do
    it 'returns the invoice generated from bill' do
      VCR.use_cassette("rest/bills/create_invoice") do
        bill_response = client.create_invoice(481)
        assert_requested :post, vindi_url("bills/481/invoice")
        expect(bill_response[0][:status]).to eq('processing')
      end
    end
  end

  describe 'delete_bill' do
    it 'returns the deleted bill' do
      VCR.use_cassette("rest/bills/delete_bill") do
        bill_response = client.delete_bill(475)
        assert_requested :delete, vindi_url("bills/475")
        expect(bill_response[:status]).to eq('canceled')
      end
    end
  end
end
