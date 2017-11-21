module OTX
  module Indicator
    module IP
      class General < OTX::Type::Base
        def initialize(attributes={})
          attributes.each do |key, value|

            unless self.respond_to?(key)
              self.class.send(:attr_accessor, key)
            end

            if key == 'pulse_info'
              send("#{key.downcase}=", OTX::Indicator::CVE::PulseInfo.new(value))
            elsif key == 'base_indicator'
              send("#{key.downcase}=", OTX::Indicator::CVE::BaseIndicator.new(value))
            else
              send("#{key.downcase}=", value)
            end
          end
        end
      end
    end
  end
end
