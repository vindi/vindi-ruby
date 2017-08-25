module Vindi
  module Rest

    # Methods for the Plans API
    # @see https://vindi.github.io/api-docs/dist/#!/plans
    module Plan

      # List plans for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Sawyer::Resource>] A list of plans for a merchant.
      # @example Get all plans from merchant vindi
      def list_plans(options = {})
        get 'plans', options
      end
      
      # Get a single plan from a merchant
      #
      # @param plan_id [Integer] ID of the plan
      # @return [Sawyer::Resource] The plan you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/plans/GET_version_plans_id_format
      # @example Get plan #2 from vindi
      #   client.plan(2)
      def plan(plan_id, options = {})
        get "plans/#{plan_id}", options
      end

      # Create a plan for a merchant vindi
      # 
      # @option options [Hash] :options Plan attributes
      # @see https://vindi.github.io/api-docs/dist/#!/plans/POST_version_plans_format 
      # @return [Sawyer::Resource] The plan created
      # @example Create a plan for a merchant vindi
      #   client.create_plan(name: 'My Plan', interval: 12)
      def create_plan(options = {})
        post "plans", options
      end

      # Edit a plan
      #
      # @params plan_id [Integer] ID of the plan
      # @option options [Hash] :options Plan attributes
      # @see https://vindi.github.io/api-docs/dist/#!/plans/PUT_version_plans_id_format
      # @example Update plan #2
      #   client.update_plan(2, name: 'My Plan', interval: 3)
      def update_plan(plan_id, options = {})
        put "plans/#{plan_id}", options
      end
    end
  end
end
