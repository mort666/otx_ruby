module OTX
  #
  # Retrieve and parse into the appropriate object the reputation for an IP Address from the OTX System
  #
  class Reputation < OTX::Base
    #
    # Download an individually identified IP Address Reputation and parse the output
    #
    # @param ip [String] The ip address to check the reputation
    # @param type [Symbol] Type of address, IPv6 or IPv4
    # @return [OTX::Pulse] Parsed Pulse
    #
    def get_reputation(ip, type=:ipv4)
      uri = "api/v1/indicators/#{type == :ipv6 ? "IPv6" : "IPv4"}/#{ip}/reputation"

      json_data = get(uri)

      reputation = OTX::Indicator::IP::Reputation.new(json_data["reputation"])

      return reputation
    end
  end
end
