require 'vindi/rest/plan'
require 'vindi/rest/product'
require 'vindi/rest/customer'

module Vindi
  module Rest
    include Vindi::Rest::Plan
    include Vindi::Rest::Product
    include Vindi::Rest::Customer
  end
end
