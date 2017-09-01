require 'vindi/rest/plan'
require 'vindi/rest/customer'

module Vindi
  module Rest
    class << self
      include Vindi::Rest::Plan
      include Vindi::Rest::Customer
    end
  end
end
