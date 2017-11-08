module OTX
  #
  # Within the OTX system you are able to subscribe to pulses from other users,
  # this class allows the retreival of the currently subscribed pulse feeds and
  # the associated pulses, as well as pulses from followed Users
  #
  class Activity < OTX::Base
    #
    # Get all pulses activity from the API, get all events in chunks defined by
    # limit
    #
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array<OTX::Pulse>] Parsed Pulses
    #
    def get_all(limit=20)
      uri = '/api/v1/pulses/activity'
      params = {limit: limit}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while !page.nil?

      results = []
      pulses.each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end

    #
    # Get all pulses activity from the API, get all events in chunks defined by
    # limit and since timestamp
    #
    # @param timestamp [Time] Timestamp of point in time to get records since in
    # ISO Format
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array<OTX::Pulse>] Parsed Pulses
    #
    def get_since(timestamp, limit=20)
      uri = '/api/v1/pulses/activity'
      params = {limit: limit, modified_since: timestamp}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while !page.nil?

      results = []
      pulses.each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end
  end
end
