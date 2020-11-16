module Vindi
  module Rest

    # Methods for the invoices API
    # @see https://vindi.github.io/api-docs/dist/#!/invoices
    module Invoice

      # List invoice for the authenticate user
      # @return [Array<Hash>] A list of invoices for a merchant.
      # @example Get all invoices from merchant vindi
      def list_invoices(options = {})
        get('invoices', options)[:invoices]
      end

      # Get a single invoice from a merchant
      #
      # @param invoice_id [Integer] ID of the invoice
      # @return [Hash] The invoice you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/invoices/GET_version_invoices_id_format
      # @example Get invoice #108 from vindi
      #   client.invoice(108)
      def invoice(invoice_id, options = {})
        get("invoices/#{invoice_id}", options)[:invoice]
      end

      # Create a invoice for a merchant vindi
      #
      # @option options [Hash] :options invoice attributes
      # @see https://vindi.github.io/api-docs/dist/#!/invoices/POST_version_invoices_format
      # @return [Hash] The invoice created
      # @example Create a invoice for a merchant vindi
      #   client.create_invoice({ bill_id: 71, amount: 1 })
      def create_invoice(options = {})
        post('invoices', options)[:invoice]
      end

      # Delete a invoice from merchant vindi
      #
      # @params invoice_id [Integer] ID of the invoice
      # @option options [Hash] :options invoice attributes
      # @see https://vindi.github.io/api-docs/dist/#!/invoices/DELETE_version_invoices_id_format
      # @example Delete invoice #108
      #   client.delete_invoice(108)
      def delete_invoice(invoice_id, options = {})
        delete("invoices/#{invoice_id}", options)[:invoice]
      end

      # Retry a invoice from merchant vindi
      #
      # @params invoice_id [Integer] ID of the invoice
      # @option options [Hash] :options invoice attributes
      # @see https://vindi.github.io/api-docs/dist/#/invoices/postV1InvoicesIdRetry
      # @example Retry a invoice from merchant vindi
      #   client.retry_invoice(108)
      def retry_invoice(invoice_id, options = {})
        post("invoices/#{invoice_id}/retry", options)[:invoice]
      end
    end
  end
end
