module Vindi
  module Rest

    # Methods for the notifications API
    # @see https://vindi.github.io/api-docs/dist/#!/notifications
    module Notification

      # List notifications for the authenticate user
      # @return [Array<Hash>] A list of notifications for a merchant.
      # @example Get all notifications from merchant vindi
      def list_notifications(options = {})
        get('notifications', options)[:notifications]
      end

      # Get a single notification from a merchant
      #
      # @param notification_id [Integer] ID of the notification
      # @return [Hash] The notification you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example Get notification #2 from vindi
      #   client.notification(2)
      def notification(notification_id, options = {})
        get("notifications/#{notification_id}", options)[:notification]
      end

      # Create a notification for a merchant vindi
      #
      # @option options [Hash] :options notification attributes
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @return [Hash] The notification created
      # @example Create a notification for a merchant vindi
      #   client.create_notification(status: "active", notification_type: "email",
      #                              name: "Hoops", subject: "Hoops",
      #                              content: "Hey, Hoops!",
      #                              trigger_type: "charge_created_at",
      #                              trigger_day: 5, bcc: "")
      def create_notification(options = {})
        post('notifications', options)[:notification]
      end

      # Edit a notification
      #
      # @params notification_id [Integer] ID of the notification
      # @option options [Hash] :options notification attributes
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example update notification #2
      #   client.update_notification(2, trigger_day: 3)
      def update_notification(notification_id, options = {})
        put("notifications/#{notification_id}", options)[:notification]
      end

      # List notification items for a merchant
      #
      # @params notification_id [Integer] ID of the notification
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example notification_items #2
      #   client.list_notification_items(2)
      def list_notification_items(notification_id, options = {})
        url = "notifications/%{id}/notification_items" % { id: notification_id }
        get(url, options)[:notification_items]
      end

      # Creates notification items for a merchant
      #
      # @params notification_id [Integer] ID of the notification
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example create notification item #2
      #   client.create_notification_item(2, item_type: "Plan", item_id: 22)
      def create_notification_item(notification_id, options = {})
        url = "notifications/%{id}/notification_items" % { id: notification_id }
        post(url, options)[:notification_item]
      end

      # Delete a notification from merchant vindi
      #
      # @params notification_id [Integer] ID of the notification
      # @option options [Hash] :options notification attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example Delete notification #2
      #   client.delete_notification(2)
      def delete_notification(notification_id, options = {})
        delete("notifications/#{notification_id}", options)[:notification]
      end

      # Delete a notification item from merchant vindi
      #
      # @params notification_id [Integer] ID of the notification
      # @params notification_item_id [Integer] ID of the notification item
      # @option options [Hash] :options notification attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/notifications
      # @example Delete notification item #3
      #   client.delete_notification_item(2, 3)
      def delete_notification_item(notification_id, notification_item_id, options = {})
        url = "notifications/%{id}/notification_items/%{notification_item_id}" % {
          id: notification_id, notification_item_id: notification_item_id
        }
        delete(url, options)[:notification_item]
      end
    end
  end
end
