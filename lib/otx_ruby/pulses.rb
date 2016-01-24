module OTX
  #
  # Retrieve and parse into the appropriate object a pulse from the OTX System
  #
  class Pulses < OTX::Base
    #
    # Download an individually identified pulse and parse the output
    #
    # @param id [String] The id value for the pulse to Download
    # @return [OTX::Pulse] Parsed Pulse
    #
    def get_pulse(id)
        uri = "/api/v1/pulses/#{id}"

        json_data = get(uri)

        pulse = OTX::Pulse.new(json_data)

        return pulse
    end
  end
end
