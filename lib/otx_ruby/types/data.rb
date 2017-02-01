module OTX
  module Indicator
    class Data < OTX::Type::Base
      attr_accessor :url, :domain, :vt, :file, :md5
    end
  end
end
