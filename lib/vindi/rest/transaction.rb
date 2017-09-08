module Vindi
  module Rest

    # Methods for the Transaction API
    # @see https://vindi.github.io/api-docs/dist/#!/transactions
    module Transaction

      # List transactions for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of transactions for a merchant.
      # @example Get all transactions from merchant vindi
      def list_transactions(options = {})
        get('transactions', options)[:transactions]
      end
      
      # Get a single transaction from a merchant
      #
      # @param transaction_id [Integer] ID of the transaction
      # @return [Hash] The transaction you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/transactions/GET_version_transactions_id_format
      # @example Get transaction #2 from vindi
      #   client.transaction(2)
      def transaction(transaction_id, options = {})
        get("transactions/#{transaction_id}", options)[:transaction]
      end

      # Create a transaction for a merchant vindi
      # 
      # @option options [Hash] :options transaction attributes
      # @see https://vindi.github.io/api-docs/dist/#!/transactions/POST_version_transactions_format 
      # @return [Hash] The transaction created
      # @example Create a transaction for a merchant vindi
      #   client.create_transaction(charge_id: 475, amount: 100,
      #                             payment_method_code: 'cash',
      #                             paid_at: "2017-09-08")
      def create_transaction(options = {})
        post('transactions', options)[:transaction]
      end

      # Edit a transaction
      #
      # @params transaction_id [Integer] ID of the transaction
      # @option options [Hash] :options transaction attributes
      # @see https://vindi.github.io/api-docs/dist/#!/transactions/PUT_version_transactions_id_format
      # @example Update transaction #2
      #   client.update_transaction(2, gateway_transaction_id: "gateway-transaction_id")
      def update_transaction(transaction_id, options = {})
        put("transactions/#{transaction_id}", options)[:transaction]
      end
    end
  end
end
