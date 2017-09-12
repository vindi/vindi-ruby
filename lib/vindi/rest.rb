Dir[File.expand_path("../rest/**/*.rb", __FILE__)].each do |file|
  require file
end

module Vindi
  module Rest
    include Vindi::Rest::Plan
    include Vindi::Rest::Product
    include Vindi::Rest::Customer
    include Vindi::Rest::PaymentMethod
    include Vindi::Rest::Discount
    include Vindi::Rest::Subscription
    include Vindi::Rest::ProductItem
    include Vindi::Rest::Period
    include Vindi::Rest::Bill
    include Vindi::Rest::BillItem
    include Vindi::Rest::Charge
    include Vindi::Rest::Transaction
    include Vindi::Rest::PaymentProfile
    include Vindi::Rest::Usage
    include Vindi::Rest::Movement
    include Vindi::Rest::Invoice
    include Vindi::Rest::Message
    include Vindi::Rest::ImportBatch
    include Vindi::Rest::Notification
    include Vindi::Rest::Issue
    include Vindi::Rest::Merchant
    include Vindi::Rest::Role
    include Vindi::Rest::User
    include Vindi::Rest::MerchantUser
  end
end
