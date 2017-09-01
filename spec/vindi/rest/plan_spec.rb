require 'spec_helper'

RSpec.describe Vindi::Client::Plan do
  let(:client) { basic_auth_client }

  describe 'list_plans' do
    it 'returns a collection of plans' do
      VCR.use_cassette("rest/plans/list_plans") do
        list_plans_response = client.list_plans
        assert_requested :get, vindi_url("plans")
        expect(list_plans_response[:plans]).to be_kind_of(Array)
      end
    end
  end

  describe 'plan' do
    it 'returns a plan from vindi' do
      VCR.use_cassette("rest/plans/plan") do
        plan_response = client.plan(15)
        assert_requested :get, vindi_url("plans/15")
        expect(plan_response[:plan]).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_plan' do
    it 'returns the newly created plan' do
      VCR.use_cassette("rest/plans/create_plan") do
        plan_attributes = { name: 'awesome plan', billing_trigger_day: 3, 
                            billing_trigger_type: 'beginning_of_period', 
                            interval_count: 1, interval: 'months' }

        plan_response = client.create_plan(plan_attributes)
        assert_requested :post, vindi_url("plans")
        expect(plan_response[:plan][:name]).to eq('awesome plan')
      end
    end
  end

  describe 'update_plan' do
    it 'returns the updated plan' do
      VCR.use_cassette("rest/plans/update_plan") do
        plan_attributes = { name: 'default plan' }
        plan_response = client.update_plan(15, plan_attributes)
        assert_requested :put, vindi_url("plans/15")
        expect(plan_response[:plan][:name]).to eq('default plan')
      end
    end
  end
end
