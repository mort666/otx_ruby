module OTX
  #
  # Retrieve and parse into the appropriate object a pulse from the OTX System
  #
  class Pulses < OTX::Base
    #
    # Create a Pulse
    #
    # @param params [Hash] Parameters to create a Pulse
    #
    def create(params)
      uri = '/api/v1/pulses/create'

      pulse = { body: params }

      post(uri, pulse)
    end

    #
    # Validate a Pulse indicator
    #
    # @param indicator [Hash] An indicator key value pair
    #
    def validate_indicator(indicator)
      uri = '/api/v1/pulses/indicators/validate'

      post(uri, indicator)
    end

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

    #
    # Search for Pulses including the query in their datafields
    #
    # @param query [String] Query to search
    # @param limit [Integer] Limit results per page to this number
    # @param page [Integer] Return results for this page
    # @param sort [Symbol] Sort results by modified, created or subscriber_count
    # @return [Array<OTX::Pulse>] Parsed Pulses
    #
    def search(query, limit = 10, page = 1, sort = :created)
      uri = '/api/v1/search/users'

      if sort == :modified || sort == :subscriber_count
        sort_by = sort.to_s
      else
        sort_by = 'created'
      end

      params = { q: query, limit: limit, page: page, sort: sort_by }
      results = []

      json_data = get(uri, params)

      json_data['results'].each do |pulse|
        results << OTX::Pulse.new(user)
      end

      return results
    end

    #
    # Edit a Pulses information
    #
    # @param id [String] The ID of the Pulse
    # @param param [Hash] Parameters to edit
    #
    def edit_pulse(id, params)
      uri = "/api/v1/pulses/#{id}"

      patch(uri, params)
    end

    #
    # GET Pulses from a user
    #
    # @param username [String] Name of the User to retrieve pulses from
    # @param limit [Integer] Limit results per page to this number
    # @param page [Integer] Return results for this page
    # @return [Array<OTX::Pulse>] Parsed Pulses
    #
    def get_user_pulses(username, limit = 10, page = 1)
      uri = "/api/v1/pulses/users/#{username}"
      params = { limit: limit, page: page }

      json_data = get(uri, params)

      json_data['results'].each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end

    #
    # GET Pulses that share indicators with a Pulse
    #
    # @param id [String] ID of the Pulse to retrieve related Pulses from
    # @param limit [Integer] Limit results per page to this number
    # @param page [Integer] Return results for this page
    # @return [Array<OTX::Pulse>] Parsed Pulses
    #
    def get_related_pulses(id, limit = 10, page = 1)
      uri = "/api/v1/pulses/#{id}/related"
      params = { limit: limit, page: page }

      json_data = get(uri, params)

      json_data['results'].each do |pulse|
        results << OTX::Pulse.new(pulse)
      end

      return results
    end

    #
    # GET a Pulses Indicators
    #
    # @param id [String] ID of the Pulse to retrieve Indicators from
    # @param limit [Integer] Limit results per page to this number
    # @param page [Integer] Return results for this page
    # @return [Array<OTX::Pulse>] Parsed Indicators
    #
    def get_pulse_indicators(id, limit = 10, page = 1)
      uri = "/api/v1/pulses/#{id}/indicators"
      params = { limit: limit, page: page }

      json_data = get(uri, params)

      json_data['results'].each do |indicator|
        results << OTX::Indicators.new(indicator)
      end

      return results
    end

    #
    # GET list of Pulse Indicator Types
    #
    # @return [Array<OTX::Indicator::IndicatorType>]
    #
    def get_pulse_indicator_types
      uri = '/api/v1/pulses/indicators/types'

      json_data = get(uri)

      types = []

      json_data.each do |type|
        types << OTX::Indicator::IndicatorType.new(type)
      end

      return types
    end
  end
end
