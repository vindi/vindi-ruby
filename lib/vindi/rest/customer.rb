module Vindi
  module Rest

    # Methods for the Customers API
    # @see https://vindi.github.io/api-docs/dist/#!/customers
    module Customer

      # List customer for the authenticate user
      # @return [Array<Hash>] A list of customers for a merchant.
      # @example Get all customers from merchant vindi
      def list_customers(options = {})
        get 'customers', options
      end
      
      # Get a single customer from a merchant
      #
      # @param customer_id [Integer] ID of the customer
      # @return [Hash] The customer you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/customers/GET_version_customers_id_format
      # @example Get customer #2 from vindi
      #   client.customer(2)
      def customer(customer_id, options = {})
        get "customers/#{customer_id}", options
      end

      # Create a customer for a merchant vindi
      # 
      # @option options [Hash] :options customer attributes
      # @see https://vindi.github.io/api-docs/dist/#!/customers/POST_version_customers_format 
      # @return [Hash] The customer created
      # @example Create a customer for a merchant vindi
      #   client.create_customer(name: 'John Doe', email: 'john.doe@mail.com')
      def create_customer(options = {})
        post "customers", options
      end

      # Edit a customer
      #
      # @params customer_id [Integer] ID of the customer
      # @option options [Hash] :options customer attributes
      # @see https://vindi.github.io/api-docs/dist/#!/customers/PUT_version_customers_id_format
      # @example update customer #2
      #   client.update_customer(2, name: 'Joana Doe', email: 'johanadoes@mail.com')
      def update_customer(customer_id, options = {})
        put "customers/#{customer_id}", options
      end

      # Delete a customer from merchant vindi
      #
      # @params customer_id [Integer] ID of the customer
      # @option options [Hash] :options customer attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/customers/DELETE_version_customers_id_format
      # @example Delete customer #2
      #   client.delete_customer(2)
      def delete_customer(customer_id, options = {})
        delete "customers/#{customer_id}", options
      end
    end
  end
end
