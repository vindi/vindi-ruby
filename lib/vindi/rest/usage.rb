module Vindi
  module Rest

    # Methods for the Usage API
    # @see https://vindi.github.io/api-docs/dist/#!/usages
    module Usage

      # Create a usage for a merchant vindi
      # 
      # @option options [Hash] :options usage attributes
      # @see https://vindi.github.io/api-docs/dist/#!/usages/POST_version_usages_format 
      # @return [Hash] The usage created
      # @example Create a usage for a merchant vindi
      #   client.create_usage(period_id: 382, product_item_id: 141,
      #                       quantity: 3)
      def create_usage(options = {})
        post('usages', options)[:usage]
      end

      # Delete a usage
      #
      # @params usage_id [Integer] ID of the usage
      # @option options [Hash] :options usage attributes
      # @see https://vindi.github.io/api-docs/dist/#!/usages/DELETE_version_usages_id_format
      # @example Delete usage #2
      #   client.delete_usage(2)
      def delete_usage(usage_id, options = {})
        delete("usages/#{usage_id}", options)[:usage]
      end
    end
  end
end
