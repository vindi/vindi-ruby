module Vindi
  module Configurable
    attr_writer :key

    class << self
      def configure
        yield self
      end
    end
  end
end
