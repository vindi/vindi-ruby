require 'vindi/default'

module Vindi

  # Configuration options for Client
  module Configuration
    attr_reader :user_agent, :middleware, :connection_options
    attr_accessor :key, :default_media_type, :api_endpoint
    
    class << self
      def keys
        @keys ||= [:key, :default_media_type, :api_endpoint, :user_agent,
                   :middleware, :connection_options]
      end
    end

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Vindi::Client]
    def configure(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      yield(self) if block_given?
    end

    def reset!
      Vindi::Configuration.keys.each do |key|
        instance_variable_set("@#{key}", Vindi::Default.options[key])
      end
    end
    alias :setup :reset!
  end
end
