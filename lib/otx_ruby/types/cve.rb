module OTX
  module Indicator
    module CVE
      class General < OTX::Type::Base
        #
        # Needs details for attributes
        #
        attr_accessor :indicator, :date_modified, :pulse_info, :references, :base_indicator

        def initialize(attributes={})
          attributes.each do |key, value|
            _key = key.gsub('-', '_')

            unless self.respond_to?(key)
              self.class.send(:attr_accessor, key)
            end

            if _key == 'pulse_info'
              @pulse_info = OTX::Indicator::CVE::PulseInfo.new(value)
            elsif _key == 'base_indicator'
              @base_indicator = OTX::Indicator::CVE::BaseIndicator.new(value)
            elsif _key == 'references'
              @references = []
              value.each do |reference|
                @references << OTX::Indicator::CVE::Reference.new(reference)
              end
            else
              send("#{_key.downcase}=", value)
            end
          end
        end

      end
    end
  end
end
