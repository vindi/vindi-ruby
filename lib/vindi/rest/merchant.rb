module Vindi
  module Rest

    # Methods for the merchants API
    # @see https://vindi.github.io/api-docs/dist/#!/merchants
    module Merchant

      # List merchants for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of merchants for a merchant.
      # @example Get all merchants from merchant vindi
      #   client.list_merchants
      def list_merchants(options = {})
        get('merchants', options)[:merchants]
      end

      # Get a current merchant for the authenticate user
      #
      # @param merchant_id [Integer] ID of the merchant
      # @return [Hash] The merchant you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/merchants/GET_version_merchants_id_format
      # @example Get a current merchant from vindi
      #   client.current_merchant
      def current_merchant
        get("merchants/current")[:merchant]
      end

      # Edit a merchant
      #
      # @params merchant_id [Integer] ID of the merchant
      # @option options [Hash] :options merchant attributes
      # @see https://vindi.github.io/api-docs/dist/#!/merchants/PUT_version_merchants_id_format
      # @example Get merchant #7 from vindi
      #   client.merchant(7)
      def merchant(merchant_id, options = {})
        get("merchants/#{merchant_id}", options)[:merchant]
      end
    end
  end
end
