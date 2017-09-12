module Vindi
  module Rest

    # Methods for the merchant_users API
    # @see https://vindi.github.io/api-docs/dist/#!/merchant_users
    module MerchantUser

      # List merchant_user for the authenticate user
      # @return [Array<Hash>] A list of merchant_users for a merchant.
      # @example Get all merchant_users from merchant vindi
      def list_merchant_users(options = {})
        get('merchant_users', options)[:merchant_users]
      end

      # Get a single merchant_user from a merchant
      #
      # @param merchant_user_id [Integer] ID of the merchant_user
      # @return [Hash] The merchant_user you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/merchant_users/GET_version_merchant_users_id_format
      # @example Get merchant_user #7 from vindi
      #   client.merchant_user(7)
      def merchant_user(merchant_user_id, options = {})
        get("merchant_users/#{merchant_user_id}", options)[:merchant_user]
      end

      # Create a merchant_user for a merchant vindi
      #
      # @option options [Hash] :options merchant_user attributes
      # @see https://vindi.github.io/api-docs/dist/#!/merchant_users/POST_version_merchant_users_format
      # @return [Hash] The merchant_user created
      # @example Create a merchant_user for a merchant vindi
      #   client.create_merchant_user(name: 'John Doe', email: 'john.doe@mail.com', role_id: 10)
      def create_merchant_user(options = {})
        post('merchant_users', options)[:merchant_user]
      end

      # Edit a merchant_user
      #
      # @params merchant_user_id [Integer] ID of the merchant_user
      # @option options [Hash] :options merchant_user attributes
      # @see https://vindi.github.io/api-docs/dist/#!/merchant_users/PUT_version_merchant_users_id_format
      # @example update merchant_user #7
      #   client.update_merchant_user(7, name: 'Joana Doe', email: 'johanadoes@mail.com')
      def update_merchant_user(merchant_user_id, options = {})
        put("merchant_users/#{merchant_user_id}", options)[:merchant_user]
      end

      # Delete a merchant_user from merchant vindi
      #
      # @params merchant_user_id [Integer] ID of the merchant_user
      # @option options [Hash] :options merchant_user attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/merchant_users/DELETE_version_merchant_users_id_format
      # @example Delete merchant_user #36
      #   client.delete_merchant_user(36)
      def delete_merchant_user(merchant_user_id, options = {})
        delete("merchant_users/#{merchant_user_id}", options)[:merchant_user]
      end

      # Reactivate a merchant_user for a merchant vindi
      #
      # @see https://vindi.github.io/api-docs/dist/#!/merchant_users/POST_version_merchant_users_format
      # @return [Hash] The merchant_user reactivated
      # @example Reactivate a merchant_user for a merchant vindi
      #   client.reactivate_merchant_user(37)
      def reactivate_merchant_user(merchant_user_id, options = {})
        post("merchant_users/#{merchant_user_id}/reactivate", options)[:merchant_user]
      end
    end
  end
end
