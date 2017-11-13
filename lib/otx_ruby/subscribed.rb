module OTX
  #
  # Within the OTX system you are able to subscribe to pulses from other users,
  # this class allows the retreival of the currently subscribed pulse feeds and the
  # associated pulses
  #
  class Subscribed < OTX::Base
    def get_subscribed(limit = 10, page = 1, params = {})
      uri = '/api/v1/pulses/subscribed'
      params['limit'] = limit
      params['page'] = page
      results = []

      json_data = get(uri, params)

      json_data['results'].each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end

    #
    # Get all subscribed pulses from the API, get all events in chunks defined by limit
    #
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array] Array of OTX::Pulse records
    #
    def get_all(limit = 20)
      uri = '/api/v1/pulses/subscribed'
      params = {limit: limit}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while page

      results = []
      pulses.each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end

    #
    # Get all subscribed pulses from the API, get all events in chunks defined by limit and since
    # timestamp
    #
    # @param timestamp [Time] Timestamp of point in time to get records since in ISO Format
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array] Array of OTX::Pulse records
    #
    def get_since(timestamp, limit = 20)
      uri = '/api/v1/pulses/subscribed'
      params = {limit: limit, modified_since: timestamp}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while page

      results = []
      pulses.each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end
  end
end
