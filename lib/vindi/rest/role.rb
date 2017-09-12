module Vindi
  module Rest

    # Methods for the roles API
    # @see https://vindi.github.io/api-docs/dist/#!/roles
    module Role

      # List roles for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of roles for a merchant.
      # @example Get all roles from merchant vindi
      def list_roles(options = {})
        get('roles', options)[:roles]
      end
    end
  end
end
