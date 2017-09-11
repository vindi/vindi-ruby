module Vindi
  module Rest

    # Methods for the issues API
    # @see https://vindi.github.io/api-docs/dist/#!/issues
    module Issue

      # List issues for the authenticate user
      # @option options [Integer] :page (1) Page number.
      # @option options [Integer] :merchant Merchant account
      # @return [Array<Hash>] A list of issues for a merchant.
      # @example Get all issues from merchant vindi
      def list_issues(options = {})
        get('issues', options)[:issues]
      end

      # Get a single issue from a merchant
      #
      # @param issue_id [Integer] ID of the issue
      # @return [Hash] The issue you requested, if it exists
      # @see https://vindi.github.io/api-docs/dist/#!/issues/GET_version_issues_id_format
      # @example Get issue #154 from vindi
      #   client.issue(2)
      def issue(issue_id, options = {})
        get("issues/#{issue_id}", options)[:issue]
      end

      # Edit a issue
      #
      # @params issue_id [Integer] ID of the issue
      # @option options [Hash] :options issue attributes
      # @see https://vindi.github.io/api-docs/dist/#!/issues/PUT_version_issues_id_format
      # @example update issue #2
      #   client.update_issue(2, status: "open")
      def update_issue(issue_id, options = {})
        put("issues/#{issue_id}", options)[:issue]
      end
    end
  end
end
