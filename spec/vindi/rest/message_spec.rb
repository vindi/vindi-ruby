require 'spec_helper'

RSpec.describe Vindi::Client::Message do
  let(:client) { basic_auth_client }

  describe 'list_messages' do
    it 'returns a collection of messages' do
      VCR.use_cassette("rest/messages/list_messages") do
        list_messages_response = client.list_messages
        assert_requested :get, vindi_url("messages")
        expect(list_messages_response).to be_kind_of(Array)
      end
    end
  end

  describe 'message' do
    it 'returns a message from vindi' do
      VCR.use_cassette("rest/messages/message") do
        message_response = client.message(154)
        assert_requested :get, vindi_url("messages/154")
        expect(message_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_message' do
    it 'returns the newly created message' do
      VCR.use_cassette("rest/messages/create_message") do
        message_attributes = { "customer_id": 2, "charge_id": 71,
                               "notification_id": 6, "email": "cliente@email.com" }

        message_response = client.create_message(message_attributes)
        assert_requested :post, vindi_url("messages")
        expect(message_response[:notification_type]).to eq('email')
      end
    end
  end
end
