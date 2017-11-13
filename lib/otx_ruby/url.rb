module OTX
  class URL < OTX::Base
    def get_general(url)
      uri = "/api/v1/indicators/url/#{url}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end

    def get_url_list(url)
      uri = "/api/v1/indicators/url/#{url}/url_list"

      page = 0
      url_list = []
      begin
        page += 1
        params = {limit: 20, page: page}
        json_data = get(uri, params)
        has_next = json_data['has_next']

        url_list += json_data['url_list']
      end while has_next

      results = []
      url_list.each do |url|
        results << OTX::Indicator::IP::URL.new(url)
      end

      return results
    end
  end
end
