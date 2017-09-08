module Vindi
  module Rest

    # Methods for the messages API
    # @see https://vindi.github.io/api-docs/dist/#!/messages
    module Message

      # List messages for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of messages for a merchant.
      # @example Get all messages from merchant vindi
      def list_messages(options = {})
        get('messages', options)[:messages]
      end

      # Get a single message from a merchant
      #
      # @param message_id [Integer] ID of the message
      # @return [Hash] The message you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/messages/GET_version_messages_id_format
      # @example Get message #154 from vindi
      #   client.message(154)
      def message(message_id, options = {})
        get("messages/#{message_id}", options)[:message]
      end

      # Create a message for a merchant vindi
      #
      # @option options [Hash] :options message attributes
      # @see https://vindi.github.io/api-docs/dist/#!/messages/POST_version_messages_format
      # @return [Hash] The message created
      # @example Create a message for a merchant vindi
      #   client.create_message({ "customer_id": 2, "charge_id": 71,
      #                           "notification_id": 6, "email": "cliente@email.com" })
      def create_message(options = {})
        post('messages', options)[:message]
      end
    end
  end
end
