module OTX
  class Hostname < OTX::Base
    def get_general(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end

    def get_geo(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/geo"

      json_data = get(uri)

      geo = OTX::Indicator::IP::Geo.new(json_data)

      return geo
    end

    def get_malware(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/malware"
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

    def get_url_list(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/url_list"

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

    def get_passive_dns(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/passive_dns"

      json_data = get(uri)

      results = []
      json_data['passive_dns'].each do |dns|
        results << OTX::Indicator::IP::DNS.new(dns)
      end

      return results
    end

    def get_http_scans(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/http_scans"

      json_data = get(uri)

      results = []
      unless json_data['data'].nil?
        json_data['data'].each do |http_scan|
          results << OTX::Indicator::IP::HTTPScan.new(http_scan)
        end
      end

      return results
    end

    #
    # Tallies total NIDS rules linked to a hostname
    #
    # @param hostname [String] Hostname to check for NIDS rules
    # @return [Integer] Total number of NIDS rules
    #
    def nids_list(hostname)
      uri = "/api/v1/indicators/hostname/#{hostname}/passive_dns"
      json_data = get(uri)

      grant_access = self.instance_variable_get('@key')
      ip_object = OTX::IP.new(grant_access)

      ip_array = []
      json_data['passive_dns'].each do |r|
        ip_array << r['address']
      end

      total = 0
      ip_array.each do |ip|
        nids_list = ip_object.nids_list(ip)
        total += nids_list.count
      end

      return total
    end
  end
end
