module OTX
  module Indicator
    module CVE
      class PulseInfo < OTX::Type::Base
        def initialize(attributes={})
          attributes.each do |key, value|
            unless self.respond_to?(key)
              self.class.send(:attr_accessor, key)
            end

            if key != 'pulses'
              send("#{key.downcase}=", value)
            else
              @pulses = []
              value.each do |pulse|
                @pulses << OTX::Pulse.new(pulse)
              end
            end
          end
        end
      end
    end
  end
end
