require 'spec_helper'

RSpec.describe Vindi::Client::Movement do
  let(:client) { basic_auth_client }

  describe 'create_movement' do
    it 'returns the newly created movement' do
      VCR.use_cassette("rest/movements/create_movement") do
        movement_attributes = { amount: 1,
                                movement_type: "credit", bill_id: 509 }

        movement_response = client.create_movement(movement_attributes)
        assert_requested :post, vindi_url("movements")
        expect(movement_response).to be_kind_of Hash
      end
    end
  end
end
