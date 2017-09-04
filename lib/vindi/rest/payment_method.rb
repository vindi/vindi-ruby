module Vindi
  module Rest

    # Methods for the Payment Methods API
    # @see https://vindi.github.io/api-docs/dist/#!/payment_methods
    module PaymentMethod

      # List payment methods for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of payment_methods for a merchant.
      # @example Get all payment_methods from merchant vindi
      def list_payment_methods(options = {})
        get('payment_methods', options)[:payment_methods]
      end
      
      # Get a single payment_method from a merchant
      #
      # @param payment_method_id [Integer] ID of the payment_method
      # @return [Hash] The payment_method you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/payment_methods/GET_version_payment_methods_id_format
      # @example Get payment_method #2 from vindi
      #   client.payment_method(2)
      def payment_method(payment_method_id, options = {})
        get("payment_methods/#{payment_method_id}", options)[:payment_method]
      end
    end
  end
end
