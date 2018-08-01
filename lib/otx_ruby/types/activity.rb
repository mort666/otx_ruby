module OTX
  module Indicator
    class Activity < OTX::Type::Base
      attr_accessor :domain, :name, :visible, :url, :data,
      :source, :vt, :file, :data_key, :md5, :status, :first_date, :data_key,
      :last_date, :type

      def initialize(attributes={})
        attributes.each do |key, value|
          if key != 'data'
            send("#{key.downcase}=", value)
          else
            @data = OTX::Indicator::Data.new(value)
          end
        end
      end
    end
  end
end
