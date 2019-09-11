module Vindi
  module Rest

    # Methods for the export_batches API
    # @see https://vindi.github.io/api-docs/dist/#!/export_batches
    module ExportBatch

      # List export batches for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of export batches for a merchant.
      # @example Get all export batches from merchant vindi
      def list_export_batches(options = {})
        get('export_batches', options)[:export_batches]
      end

      # Get a single export batch from a merchant
      #
      # @param export_batch_id [Integer] ID of the export batch
      # @return [Hash] The export batch you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/export_batches/GET_version_export_batches_id_format
      # @example Get export batch #154 from vindi
      #   client.export_batch(154)
      def export_batch(export_batch_id, options = {})
        get("export_batches/#{export_batch_id}", options)[:export_batch]
      end

      # Create an export batch for a merchant vindi
      #
      # @option options [Hash] :options export_batch attributes
      # @see https://vindi.github.io/api-docs/dist/#!/export_batches/POST_version_export_batches_format
      # @return [Hash] The export batch created
      # @example Create an export batch for a merchant vindi
      #   client.create_export_batch({ "payment_method_code": 2, "payment_company_code": "itau" })
      def create_export_batch(options = {})
        post('export_batches', options)[:export_batch]
      end


      # Approve an export batch for a merchant vindi
      #
      # @option options [Hash] :options export_batch attributes
      # @see https://vindi.github.io/api-docs/dist/#!/export_batches/POST_version_export_batches_id_approve_format
      # @return [Hash] The export batch approved
      # @example Approve an export batch for a merchant vindi
      #   client.approve_export_batch(2)
      def approve_export_batch(export_batch_id, options = {})
        post("export_batches/#{export_batch_id}/approve", options)[:export_batch]
      end
    end
  end
end
