module Vindi
  module Rest

    # Methods for the subscriptions API
    # @see https://vindi.github.io/api-docs/dist/#!/subscriptions
    module Subscription

      # List subscription for the authenticate user
      # @return [Array<Hash>] A list of subscriptions for a merchant.
      # @example Get all subscriptions from merchant vindi
      def list_subscriptions(options = {})
        get('subscriptions', options)[:subscriptions]
      end
      
      # Get a single subscription from a merchant
      #
      # @param subscription_id [Integer] ID of the subscription
      # @return [Hash] The subscription you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/GET_version_subscriptions_id_format
      # @example Get subscription #2 from vindi
      #   client.subscription(2)
      def subscription(subscription_id, options = {})
        get("subscriptions/#{subscription_id}", options)[:subscription]
      end

      # Create a subscription for a merchant vindi
      # 
      # @option options [Hash] :options subscription attributes
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/POST_version_subscriptions_format 
      # @return [Hash] The subscription created
      # @example Create a subscription for a merchant vindi
      #   client.create_subscription(plan_id: 12, customer_id: 142, 
      #                              payment_method_code: "credit_card",
      #                              product_items: [{ product_id: 14 }])
      def create_subscription(options = {})
        post('subscriptions', options)[:subscription]
      end

      # Edit a subscription
      #
      # @params subscription_id [Integer] ID of the subscription
      # @option options [Hash] :options subscription attributes
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/PUT_version_subscriptions_id_format
      # @example update subscription #2
      #   client.update_subscription(2, payment_method_code: "debit_card")
      def update_subscription(subscription_id, options = {})
        put("subscriptions/#{subscription_id}", options)[:subscription]
      end

      # Renew a subscription
      #
      # @params subscription_id [Integer] ID of the subscription
      # @option options [Hash] :options subscription attributes
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/PUT_version_subscriptions_id_format
      # @example update subscription #2
      #   client.renew_subscription(2)
      def renew_subscription(subscription_id, options = {})
        post("subscriptions/#{subscription_id}/renew", options)[:subscription]
      end

      # Reactivate a subscription
      #
      # @params subscription_id [Integer] ID of the subscription
      # @option options [Hash] :options subscription attributes
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/PUT_version_subscriptions_id_format
      # @example update subscription #2
      #   client.reactivate_subscription(2)
      def reactivate_subscription(subscription_id, options = {})
        post("subscriptions/#{subscription_id}/reactivate", options)[:subscription]
      end

      # Delete a subscription from merchant vindi
      #
      # @params subscription_id [Integer] ID of the subscription
      # @option options [Hash] :options subscription attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/DELETE_version_subscriptions_id_format
      # @example Delete subscription #2
      #   client.delete_subscription(2)
      def delete_subscription(subscription_id, options = {})
        delete("subscriptions/#{subscription_id}", options)[:subscription]
      end

      # List product items for a subscription
      #
      # @params subscription_id
      # @see https://vindi.github.io/api-docs/dist/#!/subscriptions/GET_version_subscriptions_id_product_items_format
      # @example List subscription product items #2
      #   client.list_subscription_product_items(2)
      def list_subscription_product_items(subscription_id, options = {})
        get("subscriptions/#{subscription_id}/product_items", options)[:product_items]
      end
    end
  end
end
