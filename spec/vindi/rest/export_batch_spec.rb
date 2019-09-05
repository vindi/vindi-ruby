require 'spec_helper'

RSpec.describe Vindi::Client::ExportBatch do
  let(:client) { basic_auth_client }

  describe 'list_export_batches' do
      it 'returns a collection of export batches' do
      VCR.use_cassette("rest/export_batches/list_export_batches") do
        list_export_batches_response = client.list_export_batches
        assert_requested :get, vindi_url("export_batches")
        expect(list_export_batches_response).to be_kind_of(Array)
      end
    end
  end

  describe 'export_batch' do
    it 'returns an export batch vindi' do
      VCR.use_cassette("rest/export_batches/export_batch") do
        export_batch_response = client.export_batch(15)
        assert_requested :get, vindi_url("export_batches/15")
        expect(export_batch_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_export_batch' do
    it 'returns the newly created export batch' do
      VCR.use_cassette("rest/export_batches/create_export_batch") do
        export_batch_attributes = {
          payment_method_code: 'bank_debit',
          payment_company_code: 'itau'
        }

        export_batch_response = client.create_export_batch(export_batch_attributes)
        assert_requested :post, vindi_url("export_batches")
        expect(export_batch_response[:status]).to eq('review')
      end
    end
  end

  describe 'approve_export_batch' do
    it 'approves an export batch' do
      VCR.use_cassette("rest/export_batches/approve_export_batch") do
        approve_export_batch_response = client.approve_export_batch(122)
        assert_requested :post, vindi_url("export_batches/122/approve")
        expect(approve_export_batch_response[:status]).to eq('exported')
      end
    end
  end
end
