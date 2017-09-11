require 'spec_helper'

RSpec.describe Vindi::Client::Notification do
  let(:client) { basic_auth_client }

  describe 'list_notifications' do
    it 'returns a collection of notifications' do
      VCR.use_cassette("rest/notifications/list_notifications") do
        list_notifications_response = client.list_notifications
        assert_requested :get, vindi_url("notifications")
        expect(list_notifications_response).to be_kind_of(Array)
      end
    end
  end

  describe 'notification' do
    it 'returns a notification from vindi' do
      VCR.use_cassette("rest/notifications/notification") do
        notification_response = client.notification(41)
        assert_requested :get, vindi_url("notifications/41")
        expect(notification_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_notification' do
    it 'returns the newly created notification' do
      VCR.use_cassette("rest/notifications/create_notification") do
        notification_attributes = { status: "active", notification_type: "email",
                                    name: 'Hoops', subject: 'Hoops',
                                    content: 'Hey, Hoops!',
                                    trigger_type: 'charge_due_at',
                                    trigger_day: 5 }

        notification_response = client.create_notification(notification_attributes)
        assert_requested :post, vindi_url("notifications")
        expect(notification_response[:content]).to eq('Hey, Hoops!')
      end
    end
  end

  describe 'update_notification' do
    it 'returns the updated notification' do
      VCR.use_cassette("rest/notifications/update_notification") do
        notification_attributes = { trigger_day: 3 }
        notification_response = client.update_notification(41, notification_attributes)
        assert_requested :put, vindi_url("notifications/41")
        expect(notification_response[:trigger_day]).to eq(3)
      end
    end
  end

  describe 'list_notifications_items' do
    it 'returns a collection of notification items' do
      VCR.use_cassette("rest/notifications/list_notification_items") do
        list_notifications_response = client.list_notification_items(48)
        assert_requested :get, vindi_url("notifications/48/notification_items")
        expect(list_notifications_response).to be_kind_of(Array)
      end
    end
  end

  describe 'create_notification_item' do
    it 'returns the newly created notification' do
      VCR.use_cassette("rest/notifications/create_notification_item") do
        notification_item_attributes = { item_type: "Plan", item_id: 22 }

        notification_item_response = client
          .create_notification_item(48, notification_item_attributes)

        assert_requested :post, vindi_url("notifications/48/notification_items")
        expect(notification_item_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'delete_notification_item' do
    it 'returns the deleted notification' do
      VCR.use_cassette("rest/notifications/delete_notification_item") do
        notification_item_response = client.delete_notification_item(48, 7)
        assert_requested :delete, vindi_url("notifications/48/notification_items/7")
        expect(notification_item_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'delete_notification' do
    it 'returns the deleted notification' do
      VCR.use_cassette("rest/notifications/delete_notification") do
        notification_response = client.delete_notification(47)
        assert_requested :delete, vindi_url("notifications/47")
        expect(notification_response).to be_kind_of(Hash)
      end
    end
  end
end
