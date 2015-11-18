module OTX
  class Base
    def initialize(key, server="https://otx.alienvault.com")
      @key = key
      @server = server

      @conn = Faraday.new(:url => @server) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def get(url, params={})
      response = @conn.get do |req|
        req.url url
        req.headers['X-OTX-API-KEY'] = @key
        req.params = params
      end

      return Oj.load(response.body)
    end
  end
end
