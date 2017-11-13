module OTX
  #
  # Besides receiving the pulse information, it is possible to return details of
  # events that have occured in the OTX system and affect your account. This class
  # provides a wrapper around this functionality.
  #
  class Events < OTX::Base
    #
    # Get subscribed events from the API
    #
    # @param limit [Integer] Number of records returned
    # @param page [Integer] page of records returned
    # @param params [Hash] Addtional parameters eg `modified_since: DateTime`
    #
    def get_events(limit = 10, page = 1, params = {})
      uri = '/api/v1/pulses/events'
      params['limit'] = limit
      params['page'] = page

      json_data = get(uri, params)

      events = json_data['results']

      results = []
      events.each do |event|
        results << OTX::Event.new(event)
      end
    end

    #
    # Get all events from the API, get all events in chunks defined by limit
    #
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array] Array of OTX::Event records
    #
    def get_all(limit = 20)
      uri = '/api/v1/pulses/events'
      params = {limit: limit}
      events = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        events += json_data['results']
      end while page

      results = []
      events.each do |event|
        results << OTX::Event.new(event)
      end

      return results
    end

    #
    # Get all events from the API, get all events in chunks defined by limit and since
    # timestamp
    #
    # @param timestamp [Time] Timestamp of point in time to get records since in ISO Format
    # @param limit [Integer] Size of chunk of data to be Returned (default = 20)
    # @return [Array] Array of OTX::Event records
    #
    def get_since(timestamp, limit = 20)
      uri = '/api/v1/pulses/events'
      params = {limit: limit, since: timestamp}
      events = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        events += json_data['results']
      end while page

      results = []
      events.each do |event|
        results << OTX::Event.new(event)
      end

      return results
    end
  end
end
