require 'spec_helper'

RSpec.describe Vindi::Client::ImportBatch do
  let(:client) { basic_auth_client }

  describe 'list_import_batches' do
    it 'returns a collection of import_batches' do
      VCR.use_cassette("rest/import_batches/list_import_batches") do
        list_import_batches_response = client.list_import_batches
        assert_requested :get, vindi_url("import_batches")
        expect(list_import_batches_response).to be_kind_of(Array)
      end
    end
  end
end
