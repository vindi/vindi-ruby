require 'faraday'
require 'json'

module Vindi
  module Connection

    # HTTP client for the Vindi API
    #
    # @return Faraday::Connection
    def http_client
      @http_client = Faraday.new(api_endpoint, connection_options) do |http|
        http.headers['Content-Type'] = 'application/json'
        http.request(:multipart)
        http.request(:url_encoded)
        http.basic_auth(@key, '')
        http.builder.use @middleware
        http.adapter(Faraday.default_adapter)
      end
    end

    def last_response
      @last_response if defined?(@last_response)
    end

    private

    def request(method, path, data, options = {})
      @last_response = response = http_client
        .public_send(method, URI::Parser.new.escape(path.to_s), data.to_json, options)

      response.body.empty? ? '' : symbolize_keys!(JSON.parse(response.body))
    end

    def symbolize_keys!(object)
      if object.is_a?(Array)
        object.each_with_index do |val, index|
          object[index] = symbolize_keys!(val)
        end
      elsif object.is_a?(Hash)
        object.keys.each do |key|
          object[key.to_sym] = symbolize_keys!(object.delete(key))
        end
      end
      object
    end
  end
end
