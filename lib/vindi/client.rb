require 'vindi/configuration'
require 'vindi/request'
require 'vindi/rest/plan'
require 'vindi/rest/customer'

module Vindi
  class Client
    include Vindi::Configuration
    include Vindi::Request
    include Vindi::Rest::Plan
    include Vindi::Rest::Customer

    def initialize(options = {}, &block)
      setup && configure(options, &block) 
    end
  end
end
