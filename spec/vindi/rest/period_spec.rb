require 'spec_helper'

RSpec.describe Vindi::Client::Period do
  let(:client) { basic_auth_client }

  describe 'list_periods' do
    it 'returns a collection of periods' do
      VCR.use_cassette("rest/periods/list_periods") do
        list_periods_response = client.list_periods
        assert_requested :get, vindi_url("periods")
        expect(list_periods_response).to be_kind_of(Array)
      end
    end
  end

  describe 'period' do
    it 'returns a period from vindi' do
      VCR.use_cassette("rest/periods/period") do
        period_response = client.period(360)
        assert_requested :get, vindi_url("periods/360")
        expect(period_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'create_period_bill' do
    it 'returns the newly created period' do
      VCR.use_cassette("rest/periods/create_period_bill") do
        period_response = client.create_period_bill(379)
        assert_requested :post, vindi_url("periods/379/bill")
        expect(period_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'update_period' do
    it 'returns the updated period' do
      VCR.use_cassette("rest/periods/update_period") do
        period_attributes = { billing_at: '27/09/2017' }
        period_response = client.update_period(360, period_attributes)
        assert_requested :put, vindi_url("periods/360")
        expect(period_response[:billing_at]).to match('2017-09-27')
      end
    end
  end

  describe 'list_period_usages' do
    it 'returns a collection of usages for given period' do
      VCR.use_cassette("rest/periods/list_period_usages") do
        usages_response = client.list_period_usages(382)
        assert_requested :get, vindi_url("periods/382/usages")
        expect(usages_response).to be_kind_of(Array)
      end
    end
  end
end
