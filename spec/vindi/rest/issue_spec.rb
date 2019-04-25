require 'spec_helper'

RSpec.describe Vindi::Client::Issue do
  let(:client) { basic_auth_client }

  describe 'list_issues' do
    it 'returns a collection of issues' do
      VCR.use_cassette("rest/issues/list_issues") do
        list_issues_response = client.list_issues
        assert_requested :get, vindi_url("issues")
        expect(list_issues_response).to be_kind_of(Array)
      end
    end
  end

  describe 'issue' do
    it 'returns a issue from vindi' do
      VCR.use_cassette("rest/issues/issue") do
        issue_response = client.issue(112)
        assert_requested :get, vindi_url("issues/112")
        expect(issue_response).to be_kind_of(Hash)
      end
    end
  end

  describe 'update issue' do
    it 'returns the newly created issue' do
      VCR.use_cassette("rest/issues/update_issue") do
        issue_attributes = { status: "open" }

        issue_response = client.update_issue(112, issue_attributes)
        assert_requested :put, vindi_url("issues/112")
        expect(issue_response[:status]).to eq('open')
      end
    end
  end
end
