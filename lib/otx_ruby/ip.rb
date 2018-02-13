module OTX
  class IP < OTX::Base
    def get_general(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end

    def get_reputation(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/reputation"

      json_data = get(uri)

      if json_data['reputation']
        reputation = OTX::Indicator::IP::Reputation.new(json_data["reputation"])
      end

      return reputation
    end

    def get_geo(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/geo"

      json_data = get(uri)

      geo = OTX::Indicator::IP::Geo.new(json_data)

      return geo
    end

    def get_malware(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/malware"
      malwares = []
      params = {}

      begin
        json_data = get(uri, params)
        page = json_data['next']

        params = URI::decode_www_form(URI(page).query).to_h unless page.nil?

        malwares += json_data['data']
      end while page && !json_data['data'].empty?

      results = []
      malwares.each do |malware|
        results << OTX::Indicator::IP::Malware.new(malware)
      end

      return results
    end

    def get_url_list(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/url_list"

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

    def get_passive_dns(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/passive_dns"

      json_data = get(uri)

      results = []
      json_data['passive_dns'].each do |dns|
        results << OTX::Indicator::IP::DNS.new(dns)
      end

      return results
    end

    def get_http_scans(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/http_scans"

      json_data = get(uri)

      results = []
      json_data['data'].each do |http_scan|
        results << OTX::Indicator::IP::HTTPScan.new(http_scan)
      end

      return results
    end

    #
    # NIDS rules associated with an IP
    #
    # @param ip [String] IP Address for lookup
    # @param type [String] Format of IP Address e.g 'IPv4', 'IPv6'
    # @return [Object] Object created from NIDS list json data
    #
    def nids_list(ip, type = :ipv4)
      uri = "/api/v1/indicators/#{type == :ipv6 ? 'IPv6' : 'IPv4'}/#{ip}/nids_list"

      json_data = get(uri)

      nids_list = OTX::Indicator::IP::NidsList.new(json_data)

      return nids_list
    end
  end
end
