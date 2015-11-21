module OTX
  class Events < OTX::Base
    def get_all(limit=20)
      uri = '/api/v1/pulses/events'
      params = {limit: limit}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while !page.nil?

      return pulses
    end

    def get_since(timestamp, limit=20)
      uri = '/api/v1/pulses/events'
      params = {limit: limit, since: timestamp}
      pulses = []
      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        pulses += json_data['results']
      end while !page.nil?

      return pulses
    end
  end
end
