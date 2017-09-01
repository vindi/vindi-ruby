module Vindi
  module Rest

    # Methods for the products API
    # @see https://vindi.github.io/api-docs/dist/#!/products
    module Product

      # List products for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of products for a merchant.
      # @example Get all products from merchant vindi
      def list_products(options = {})
        get('products', options)
      end
      
      # Get a single product from a merchant
      #
      # @param product_id [Integer] ID of the product
      # @return [Hash] The product you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/products/GET_version_products_id_format
      # @example Get product #2 from vindi
      #   client.product(2)
      def product(product_id, options = {})
        get "products/#{product_id}", options
      end

      # Create a product for a merchant vindi
      # 
      # @option options [Hash] :options product attributes
      # @see https://vindi.github.io/api-docs/dist/#!/products/POST_version_products_format 
      # @return [Hash] The product created
      # @example Create a product for a merchant vindi
      #   client.create_product(name: 'My product', interval: 12)
      def create_product(options = {})
        post "products", options
      end

      # Edit a product
      #
      # @params product_id [Integer] ID of the product
      # @option options [Hash] :options product attributes
      # @see https://vindi.github.io/api-docs/dist/#!/products/PUT_version_products_id_format
      # @example Update product #2
      #   client.update_product(2, name: 'My product', interval: 3)
      def update_product(product_id, options = {})
        put "products/#{product_id}", options
      end
    end
  end
end
