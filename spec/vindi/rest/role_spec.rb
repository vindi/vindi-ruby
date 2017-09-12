require 'spec_helper'

RSpec.describe Vindi::Client::Role do
  let(:client) { basic_auth_client }

  describe 'list_roles' do
    it 'returns a collection of roles' do
      VCR.use_cassette("rest/roles/list_roles") do
        list_roles_response = client.list_roles
        assert_requested :get, vindi_url("roles")
        expect(list_roles_response).to be_kind_of(Array)
      end
    end
  end
end
