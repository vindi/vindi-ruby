require 'vindi/configuration'
require 'vindi/request'
require 'vindi/rest'

module Vindi
  class Client
    include Vindi::Configuration
    include Vindi::Request
    include Vindi::Rest

    def initialize(options = {}, &block)
      setup && configure(options, &block) 
    end
  end
end
