module OTX
  class Domain < OTX::Base
    def get_general(domain)
      uri = "/api/v1/indicators/domain/#{domain}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end

    def get_geo(domain)
      uri = "/api/v1/indicators/domain/#{domain}/geo"

      json_data = get(uri)

      geo = OTX::Indicator::IP::Geo.new(json_data)

      return geo
    end

    def get_malware(domain)
      uri = "/api/v1/indicators/domain/#{domain}/malware"
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

    def get_url_list(domain)
      uri = "/api/v1/indicators/domain/#{domain}/url_list"

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

    def get_passive_dns(domain)
      uri = "/api/v1/indicators/domain/#{domain}/passive_dns"

      json_data = get(uri)

      results = []
      json_data['passive_dns'].each do |dns|
        results << OTX::Indicator::IP::DNS.new(dns)
      end

      return results
    end

    def whois(domain)
      uri = "/api/v1/indicators/domain/#{domain}/whois"

      json_data = get(uri)

      whois = OTX::Indicator::IP::Whois.new(json_data)

      return whois
    end


    #
    # Builds a PassiveDNS object using returned JSON from the OTX api
    #
    # @param [String] Domain to check for passive dns results
    # @return [Object] Passive dns object built from OTX json results
    #
    def passive_dns(domain)
      uri = "/api/v1/indicators/domain/#{domain}/passive_dns"
      json_data = get(uri)

      passive_dns = OTX::Indicator::IP::PassiveDNS.new(json_data)

      return passive_dns
    end

    #
    # Tallies total NIDS rules linked to a domain
    #
    # @param domain [String] Domain to check for NIDS rules
    # @param ips [Array] IPs to check for linked NIDS rules
    # @return [Integer] Total number of NIDS rules
    #
    def nids_list(domain, ips)
      grant_access = self.instance_variable_get('@key')
      ip_object = OTX::IP.new(grant_access)

      total = 0
      ips.each do |ip|
        nids_list = ip_object.nids_list(ip)
        total += nids_list.count
      end

      return total
    end
  end
end
