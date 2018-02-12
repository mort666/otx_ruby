module OTX
  module Indicator
    module IP
      class NidsList < OTX::Type::Base
        attr_accessor :ip, :domain, :hostname, :nids_hits
      end
    end
  end
end
