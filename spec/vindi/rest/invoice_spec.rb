require 'spec_helper'

RSpec.describe Vindi::Client::Invoice do
  let(:client) { basic_auth_client }

  describe 'list_invoices' do
    it 'returns a collection of invoices' do
      VCR.use_cassette("rest/invoices/list_invoices") do
        list_invoices_response = client.list_invoices
        assert_requested :get, vindi_url("invoices")
        expect(list_invoices_response).to be_kind_of(Array)
      end
    end
  end

  describe 'invoice' do
    it 'returns a invoice from vindi' do
      VCR.use_cassette("rest/invoices/invoice") do
        invoice_response = client.invoice(108)
        assert_requested :get, vindi_url("invoices/108")
        expect(invoice_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_invoice' do
    it 'returns the newly created invoice' do
      VCR.use_cassette("rest/invoices/create_invoice") do
        invoice_attributes = { bill_id: 71, amount: 1 }

        invoice_response = client.create_invoice(invoice_attributes)
        assert_requested :post, vindi_url("invoices")
        expect(invoice_response[:amount]).to eq('1.0')
      end
    end
  end

  describe 'delete_invoice' do
    it 'returns the deleted invoice' do
      VCR.use_cassette("rest/invoices/delete_invoice") do
        invoice_response = client.delete_invoice(108)
        assert_requested :delete, vindi_url("invoices/108")
        expect(invoice_response[:status]).to eq('canceled')
      end
    end
  end

  describe 'retry_invoice' do
    it 'returns the retried invoice' do
      VCR.use_cassette("rest/invoices/retry_invoice") do
        invoice_response = client.retry_invoice(108)
        assert_requested :post, vindi_url("invoices/108/retry")
        expect(invoice_response[:status]).to eq('processing')
      end
    end
  end
end
