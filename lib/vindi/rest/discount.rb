module Vindi
  module Rest

    # Methods for the discount API
    # @see https://vindi.github.io/api-docs/dist/#!/discounts
    module Discount

      # Get a single discount from a merchant
      #
      # @param discount_id [Integer] ID of the discount
      # @return [Hash] The discount you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/discounts/GET_version_discounts_id_format
      # @example Get discount #2 from vindi
      #   client.discount(2)
      def discount(discount_id, options = {})
        get("discounts/#{discount_id}", options)[:discount]
      end

      # Create a discount for a merchant vindi
      # 
      # @option options [Hash] :options discount attributes
      # @see https://vindi.github.io/api-docs/dist/#!/discounts/POST_version_discounts_format 
      # @return [Hash] The discount created
      # @example Create a discount for a merchant vindi
      #   client.create_discount(product_item_id: 118,
      #                          discount_type: "percentage", percentage: 10,
      #                          amount: 1, quantity: 1, cycles: 1)
      def create_discount(options = {})
        post('discounts', options)[:discount]
      end

      # Delete a discount from merchant vindi
      #
      # @params discount_id [Integer] ID of the discount
      # @option options [Hash] :options discount attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/discounts/DELETE_version_discounts_id_format
      # @example Delete discount #2
      #   client.delete_discount(2)
      def delete_discount(discount_id, options = {})
        delete("discounts/#{discount_id}", options)[:discount]
      end
    end
  end
end
