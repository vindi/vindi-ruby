module Vindi
  module Rest

    # Methods for the Import Batch API
    # @see https://vindi.github.io/api-docs/dist/#!/import_batches
    module ImportBatch

      # List import_batches for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of imported batches for a merchant.
      # @example Get all import_batches from merchant vindi
      def list_import_batches(options = {})
        get('import_batches', options)[:import_batches]
      end

      # Get a single import_batch from a merchant
      #
      # @param import_batch_id [Integer] ID of the import_batch
      # @return [Hash] The import_batch you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/import_batches/GET_version_import_batches_id_format
      # @example Get import_batch #2 from vindi
      #   client.import_batch(2)
      def import_batch(import_batch_id, options = {})
        get("import_batches/#{import_batch_id}", options)[:import_batch]
      end

      # Create a import_batch for a merchant vindi
      #
      # @option options [Hash] :options import_batch attributes
      # @see https://vindi.github.io/api-docs/dist/#!/import_batches/POST_version_import_batches_format
      # @return [Hash] The import_batch created
      def create_import_batch(options = {})
        post('import_batches', options)[:import_batch]
      end
    end
  end
end
