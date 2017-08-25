require 'sawyer'

module Vindi
  module Connection

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def get(url, options = {})
      request :get, url, options
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def post(url, options = {})
      request :post, url, options
    end

    # Make a HTTP PUT request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def put(url, options = {})
      request :put, url, options
    end

    # Make a HTTP PATCH request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def patch(url, options = {})
      request :patch, url, options
    end

    # Make a HTTP DELETE request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def delete(url, options = {})
      request :delete, url, options
    end

    # Make a HTTP HEAD request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def head(url, options = {})
      request :head, url, options
    end
   
    # Hypermedia agent for the Vindi API
    #
    # @return [Sawyer::Agent]
    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:accept] = default_media_type
        http.headers[:content_type] = "application/json"
        http.headers[:user_agent] = user_agent
        http.basic_auth(@key, '')
      end
    end

    def last_response
      @last_response if defined?(@last_response)
    end

    private

    def sawyer_options
      { links_parser: Sawyer::LinkParsers::Simple.new }
    end

    def request(method, path, data, options = {})
      @last_response = response = agent.call(
        method, URI::Parser.new.escape(path.to_s), data, options
      )

      response.data 
    end
  end
end
