module Vindi
  module Rest

    # Methods for the bills API
    # @see https://vindi.github.io/api-docs/dist/#!/bills
    module Bill

      # List bill for the authenticate user
      # @return [Array<Hash>] A list of bills for a merchant.
      # @example Get all bills from merchant vindi
      def list_bills(options = {})
        get('bills', options)[:bills]
      end
      
      # Get a single bill from a merchant
      #
      # @param bill_id [Integer] ID of the bill
      # @return [Hash] The bill you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/bills/GET_version_bills_id_format
      # @example Get bill #2 from vindi
      #   client.bill(2)
      def bill(bill_id, options = {})
        get("bills/#{bill_id}", options)[:bill]
      end

      # Create a bill for a merchant vindi
      # 
      # @option options [Hash] :options bill attributes
      # @see https://vindi.github.io/api-docs/dist/#!/bills/POST_version_bills_format 
      # @return [Hash] The bill created
      # @example Create a bill for a merchant vindi
      #   client.create_bill(customer_id: 2, payment_method_code: "credit_card",
      #                      bill_items: [{ product_id: 26, amount: 1 }])
      def create_bill(options = {})
        post('bills', options)[:bill]
      end

      # Edit a bill
      #
      # @params bill_id [Integer] ID of the bill
      # @option options [Hash] :options bill attributes
      # @see https://vindi.github.io/api-docs/dist/#!/bills/PUT_version_bills_id_format
      # @example update bill #2
      #   client.update_bill(2, payment_method_code: "debit_card")
      def update_bill(bill_id, options = {})
        put("bills/#{bill_id}", options)[:bill]
      end

      # Approve a bill
      #
      # @params bill_id [Integer] ID of the bill
      # @option options [Hash] :options bill attributes
      # @see https://vindi.github.io/api-docs/dist/#!/bills/PUT_version_bills_id_format
      # @example approve bill #2
      #   client.approve_bill(2)
      def approve_bill(bill_id, options = {})
        post("bills/#{bill_id}/approve", options)[:bill]
      end

      # Charge a bill
      #
      # @params bill_id [Integer] ID of the bill
      # @option options [Hash] :options bill attributes
      # @see https://vindi.github.io/api-docs/dist/#!/bills/PUT_version_bills_id_format
      # @example charge bill #2
      #   client.charge_bill(2)
      def charge_bill(bill_id, options = {})
        post("bills/#{bill_id}/charge", options)[:bill]
      end

      # Generate invoice from a bill
      #
      # @params bill_id [Integer] ID of the bill
      # @option options [Hash] :options bill attributes
      # @see https://vindi.github.io/api-docs/dist/#!/bills/PUT_version_bills_id_format
      # @example create  a invoice from bill #2
      #   client.create_invoice(2)
      def create_invoice(bill_id, options = {})
        post("bills/#{bill_id}/invoice", options)[:invoices]
      end

      # Delete a bill from merchant vindi
      #
      # @params bill_id [Integer] ID of the bill
      # @option options [Hash] :options bill attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/bills/DELETE_version_bills_id_format
      # @example Delete bill #2
      #   client.delete_bill(2)
      def delete_bill(bill_id, options = {})
        delete("bills/#{bill_id}", options)[:bill]
      end
    end
  end
end
