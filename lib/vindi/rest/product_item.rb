module Vindi
  module Rest

    # Methods for the product_items API
    # @see https://vindi.github.io/api-docs/dist/#!/product_items
    module ProductItem

      # Get a single product_item from a merchant
      #
      # @param product_item_id [Integer] ID of the product_item
      # @return [Hash] The product_item you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/product_items/GET_version_product_items_id_format
      # @example Get product_item #2 from vindi
      #   client.product_item(2)
      def product_item(product_item_id, options = {})
        get("product_items/#{product_item_id}", options)[:product_item]
      end

      # Create a product_item for a merchant vindi
      # 
      # @option options [Hash] :options product_item attributes
      # @see https://vindi.github.io/api-docs/dist/#!/product_items/POST_version_product_items_format 
      # @return [Hash] The product_item created
      # @example Create a product_item for a merchant vindi
      #   client.create_product_item(product_id: 26, quantity: 1)
      def create_product_item(options = {})
        post('product_items', options)[:product_item]
      end

      # Edit a product_item
      #
      # @params product_item_id [Integer] ID of the product_item
      # @option options [Hash] :options product_item attributes
      # @see https://vindi.github.io/api-docs/dist/#!/product_items/PUT_version_product_items_id_format
      # @example Update product_item #2
      #   client.update_product_item(2, quantity: 2)
      def update_product_item(product_item_id, options = {})
        put("product_items/#{product_item_id}", options)[:product_item]
      end

      # Delete a product_item from merchant vindi
      #
      # @params product_item_id [Integer] ID of the product_item
      # @option options [Hash] :options product_item attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/product_items/DELETE_version_product_items_id_format
      # @example Delete product_item #2
      #   client.delete_product_item(2)
      def delete_product_item(product_item_id, options = {})
        delete("product_items/#{product_item_id}", options)[:product_item]
      end
    end
  end
end
