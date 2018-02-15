module OTX
  module Indicator
    module IP
      class DNS < OTX::Type::Base
        def get_ips
          ips = []
          @passive_dns.each do |r|
            ips << r['address']
          end

          return ips
        end
      end
    end
  end
end
