module OTX
  #
  # Retrieve and parse into the appropriate object the reputation for an IP Address from the OTX System
  #
  class CVE < OTX::Base
    #
    # Download an individually identified IP Address Reputation and parse the output
    #
    # @param cve [String] The CVE ID to check
    # @return [OTX::Pulse] Parsed CVE Indicator
    #
    def get_general(cve)
      uri = "api/v1/indicators/cve/#{cve}/general"

      json_data = get(uri)

      general = OTX::Indicator::CVE::General.new(json_data)

      return general
    end
  end
end
