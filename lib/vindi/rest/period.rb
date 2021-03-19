module Vindi
  module Rest

    # Methods for the periods API
    # @see https://vindi.github.io/api-docs/dist/#!/periods
    module Period

      # List periods for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of periods for a merchant.
      # @example Get all periods from merchant vindi
      def list_periods(options = {})
        get('periods', options)[:periods]
      end
      
      # Get a single period from a merchant
      #
      # @param period_id [Integer] ID of the period
      # @return [Hash] The period you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/periods/GET_version_periods_id_format
      # @example Get period #2 from vindi
      #   client.period(2)
      def period(period_id, options = {})
        get("periods/#{period_id}", options)[:period]
      end

      # Create a period for a merchant vindi
      # 
      # @option options [Hash] :options period attributes
      # @see https://vindi.github.io/api-docs/dist/#!/periods/POST_version_periods_format 
      # @param bill_id [Integer] ID of the period to generate a bill
      # @return [Hash] The period created
      # @example Create a period for a merchant vindi
      #   client.create_period_bill(360)
      def create_period_bill(period_id, options = {})
        post("periods/#{period_id}/bill", options)
      end

      # Edit a period
      #
      # @params period_id [Integer] ID of the period
      # @option options [Hash] :options period attributes
      # @see https://vindi.github.io/api-docs/dist/#!/periods/PUT_version_periods_id_format
      # @example Update period #2
      #   client.update_period(2, name: 'My period', interval: 3)
      def update_period(period_id, options = {})
        put("periods/#{period_id}", options)[:period]
      end

      # List period usages
      #
      # @params period_id [Integer] ID of the period
      # @option options [Integer] :page (1) Page number.
      # @return [Array<Hash>] A list of usages for a period.
      # @see https://vindi.github.io/api-docs/dist/#/periods/getV1PeriodsIdUsages
      # @example List period usages
      #   client.list_period_usages(2)
      def list_period_usages(period_id, options = {})
        get("periods/#{period_id}/usages", options)[:usages]
      end
    end
  end
end
