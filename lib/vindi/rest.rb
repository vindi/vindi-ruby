require 'vindi/rest/plan'
require 'vindi/rest/product'
require 'vindi/rest/customer'
require 'vindi/rest/payment_method'

module Vindi
  module Rest
    include Vindi::Rest::Plan
    include Vindi::Rest::Product
    include Vindi::Rest::Customer
    include Vindi::Rest::PaymentMethod
  end
end
