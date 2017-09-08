module Vindi
  module Rest

    # Methods for the Movement API
    # @see https://vindi.github.io/api-docs/dist/#!/movements
    module Movement

      # Create a movement for a merchant vindi
      # 
      # @option options [Hash] :options movement attributes
      # @see https://vindi.github.io/api-docs/dist/#!/movements/POST_version_movement_format 
      # @return [Hash] The movement created
      # @example Create a movement for a merchant vindi
      #   client.create_movement(amount: 100, movement_type: "credit",
      #                          bill_id: 466)
      def create_movement(options = {})
        post('movements', options)[:movement]
      end
    end
  end
end
