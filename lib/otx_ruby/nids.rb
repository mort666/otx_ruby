module OTX
  class NIDS < OTX::Base
    def get_general(nid)
      uri = "/api/v1/indicators/nids/#{nid}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end
  end
end
