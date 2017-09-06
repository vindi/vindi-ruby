module Vindi
  module Rest

    # Methods for the bill_items API
    # @see https://vindi.github.io/api-docs/dist/#!/bill_items
    module BillItem
      
      # Get a single bill_item from a merchant
      #
      # @param bill_item_id [Integer] ID of the bill_item
      # @return [Hash] The bill_item you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/bill_items/GET_version_bill_items_id_format
      # @example Get bill_item #2 from vindi
      #   client.bill_item(2)
      def bill_item(bill_item_id, options = {})
        get("bill_items/#{bill_item_id}", options)[:bill_item]
      end
    end
  end
end
