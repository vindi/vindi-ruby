require 'spec_helper'

RSpec.describe Vindi::Client::User do
  let(:client) { basic_auth_client }

  describe 'current_user' do
    it 'returns the current user' do
      VCR.use_cassette("rest/users/current_user") do
        current_user_response = client.current_user
        assert_requested :get, vindi_url("users/current")
      end
    end
  end
end
