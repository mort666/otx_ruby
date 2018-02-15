module OTX
  module Indicator
    module IP
      class PassiveDNS < OTX::Type::Base
        attr_accessor :count, :passive_dns

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
