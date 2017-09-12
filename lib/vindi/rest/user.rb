module Vindi
  module Rest

    # Methods for the users API
    # @see https://vindi.github.io/api-docs/dist/#!/users
    module User

      # List the authenticated current user
      #
      # @return <Hash> a current user.
      # @example Get current user from merchant vindi
      def current_user
        get('users/current')[:user]
      end
    end
  end
end
