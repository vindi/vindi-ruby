module Vindi
  module Rest

    # Methods for the Payment profile API
    # @see https://vindi.github.io/api-docs/dist/#!/payment_profiles
    module PaymentProfile

      # List payment_profile for the authenticate user
      # @return [Array<Hash>] A list of payment_profiles for a merchant.
      # @example Get all payment_profiles from merchant vindi
      def list_payment_profiles(options = {})
        get('payment_profiles', options)[:payment_profiles]
      end
      
      # Get a single payment_profile from a merchant
      #
      # @param payment_profile_id [Integer] ID of the payment_profile
      # @return [Hash] The payment_profile you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/payment_profiles/GET_version_payment_profiles_id_format
      # @example Get payment_profile #2 from vindi
      #   client.payment_profile(2)
      def payment_profile(payment_profile_id, options = {})
        get("payment_profiles/#{payment_profile_id}", options)[:payment_profile]
      end

      # Create a payment_profile for a merchant vindi
      # 
      # @option options [Hash] :options payment_profile attributes
      # @see https://vindi.github.io/api-docs/dist/#!/payment_profiles/POST_version_payment_profiles_format 
      # @return [Hash] The payment_profile created
      # @example Create a payment_profile for a merchant vindi
      #   client.create_payment_profile(holder_name: "Jane Doe", card_cvv: "123",
      #                                 card_expiration: "12/2018", customer_id: 51)
      #                                 card_number: "5167454851671773",
      #                                 payment_method_code: "credit_card",
      #                                 payment_company_code: "mastercard",
      def create_payment_profile(options = {})
        post('payment_profiles', options)[:payment_profile]
      end

      # Delete a payment_profile from merchant vindi
      #
      # @params payment_profile_id [Integer] ID of the payment_profile
      # @option options [Hash] :options payment_profile attributes
      #
      # @see https://vindi.github.io/api-docs/dist/#!/payment_profiles/DELETE_version_payment_profiles_id_format
      # @example Delete payment_profile #2
      #   client.delete_payment_profile(2)
      def delete_payment_profile(payment_profile_id, options = {})
        delete("payment_profiles/#{payment_profile_id}", options)[:payment_profile]
      end
    end
  end
end
