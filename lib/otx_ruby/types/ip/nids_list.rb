module OTX
  module Indicator
    module IP
      class NidsList < OTX::Type::Base
        attr_accessor :count, :limit, :results
      end
    end
  end
end
