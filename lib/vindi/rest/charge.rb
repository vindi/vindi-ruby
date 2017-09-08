module Vindi
  module Rest

    # Methods for the charges API
    # @see https://vindi.github.io/api-docs/dist/#!/charges
    module Charge

      # List charge for the authenticate user
      # @return [Array<Hash>] A list of charges for a merchant.
      # @example Get all charges from merchant vindi
      def list_charges(options = {})
        get('charges', options)[:charges]
      end
      
      # Get a single charge from a merchant
      #
      # @param charge_id [Integer] ID of the charge
      # @return [Hash] The charge you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/charges/GET_version_charges_id_format
      # @example Get charge #2 from vindi
      #   client.charge(2)
      def charge(charge_id, options = {})
        get("charges/#{charge_id}", options)[:charge]
      end

      # Edit a charge
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      # @see https://vindi.github.io/api-docs/dist/#!/charges/PUT_version_charges_id_format
      # @example update charge #2
      #   client.update_charge(2, installments: 3)
      def update_charge(charge_id, options = {})
        put("charges/#{charge_id}", options)[:charge]
      end

      # Reissue a charge
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      # @see https://vindi.github.io/api-docs/dist/#!/charges/PUT_version_charges_id_format
      # @example reissue charge #2
      #   client.reissue_charge(2, payment_method_code: 'debit_card')
      def reissue_charge(charge_id, options = {})
        post("charges/#{charge_id}/reissue", options)[:charge]
      end

      # Perform a charge
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      # @see https://vindi.github.io/api-docs/dist/#!/charges/PUT_version_charges_id_format
      # @example perform a charge #2
      #   client.perform_charge(2)
      def perform_charge(charge_id, options = {})
        post("charges/#{charge_id}/charge", options)[:charge]
      end

      # Refund from a charge
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      # @see https://vindi.github.io/api-docs/dist/#!/charges/PUT_version_charges_id_format
      # @example refund from charge #2
      #   client.refund_charge(2, amount: 50)
      def refund_charge(charge_id, options = {})
        post("charges/#{charge_id}/refund", options)[:charge]
      end

      # Perform fraud review
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      # @see https://vindi.github.io/api-docs/dist/#!/charges/PUT_version_charges_id_format
      # @example perform a fraud review charge #2
      #   client.fraud_review_charge(2)
      def fraud_review(charge_id, options = {})
        post("charges/#{charge_id}/fraud_review", options)[:charge]
      end

      # Delete a charge from merchant vindi
      #
      # @params charge_id [Integer] ID of the charge
      # @option options [Hash] :options charge attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/charges/DELETE_version_charges_id_format
      # @example Delete charge #2
      #   client.delete_charge(2)
      def delete_charge(charge_id, options = {})
        delete("charges/#{charge_id}", options)[:charge]
      end
    end
  end
end
