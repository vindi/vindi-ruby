require 'vindi/response/raise_error'
require 'vindi/version'

module Vindi
  module Default
    # Default API endpoint 
    API_ENDPOINT = 'https://staging-app.vindi.com.br/api/v1/'.freeze
    
    # Default media type
    MEDIA_TYPE   = 'application/vnd.api+json'.freeze

    # Default User Agent header string
    USER_AGENT   = "Vindi-Ruby/#{Vindi::VERSION}".freeze

    MIDDLEWARE   = Vindi::Response::RaiseError

    class << self
    
      # Default api endpoint string from ENV or API_ENDPOINT
      # @return [String]
      def api_endpoint
        ENV['VINDI_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default media type header string from ENV or MEDIA_TYPE
      # @return [String]
      def default_media_type
        ENV['VINDI_MEDIA_TYPE'] || MEDIA_TYPE
      end

      # Default user KEY string from ENV
      # @return [String]
      def key
        ENV['VINDI_KEY']
      end

      # Default User-Agent header string from ENV or USER_AGENT
      # @return [String]
      def user_agent
        ENV['VINDI_USER_AGENT'] || USER_AGENT
      end

      def middleware
        MIDDLEWARE
      end

      def connection_options
        {
          headers: {
            'User-Agent': user_agent
          }
        }
      end

      # Default Settings for Vindi Ruby Gem
      # @return [Hash]
      def options
        Hash[Vindi::Configuration.keys
          .map{ |key| [key, send(key)] }]
      end
    end
  end
end
