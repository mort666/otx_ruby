module OTX
  class Export < OTX::Base
    def get_export(limit = 10, page = 1, params = {})
      uri = '/api/v1/indicators/export'

      params['limit'] = limit
      params['page'] = page
      indicators = []

      json_data = get(uri, params)

      json_data['results'].each do |indicator|
        indicators << OTX::Indicators.new(indicator)
      end

      return indicators
    end

    def get_all(limit = 20)
      uri = '/api/v1/indicators/export'
      params = { limit: limit }
      indicators = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        indicators += json_data['results']
      end while page

      results = []
      indicators.each do |indicator|
        results << OTX::Indicators.new(indicator)
      end

      return results
    end

    def get_since(timestamp, limit = 20)
      uri = '/api/v1/indicators/export'
      params = { limit: limit, modified_since: timestamp }
      indicators = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        indicators += json_data['results']
      end while page

      results = []
      indicators.each do |indicator|
        results << OTX::Indicators.new(indicator)
      end

      return results
    end

    def get_only(list_of_types, limit = 20)
      uri = '/api/v1/indicators/export'
      params = { limit: limit, types: list_of_types }
      indicators = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        indicators += json_data['results']
      end while page

      results = []
      indicators.each do |indicator|
        results << OTX::Indicator.new(indicator)
      end

      return results
    end

    def get_only_since(list_of_types, timestamp, limit = 20)
      uri = '/api/v1/indicators/export'
      params = { limit: limit, types: list_of_types, modified_since: timestamp }
      indicators = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        indicators += json_data['results']
      end while page

      results = []
      indicators.each do |indicator|
        results << OTX::Indicator.new(indicator)
      end

      return results
    end
  end
end
