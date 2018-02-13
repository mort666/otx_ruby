module OTX
  #
  # Base Class for API access, provides initial wrapper around Faraday performs
  # base request
  #
  class Base
    #
    # Initialise object
    #
    # @param key [String] API Key for AlienVault OTX API
    # @param server [String] Base URL for API, defaults to 'https://otx.alienvault.com'
    #
    def initialize(key, server="https://otx.alienvault.com")
      @key = key
      @server = server

      @conn = Faraday.new(:url => @server) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    #
    # GET the provided URL
    #
    # @param url [String] URL to make API request to
    # @param params [Hash] Additional parameters to be added to the requests
    #
    def get(url, params={})
      response = @conn.get do |req|
        req.url url
        req.headers['X-OTX-API-KEY'] = @key
        req.params = params
      end

      # Parse and return JSON object as hash to caller
      return Oj.load(response.body)
    end

    #
    # POST to the provided URL
    #
    # @param url [String] URL to make API request to
    # @param params [Hash] Additional parameters to be added to the requests
    #
    def post(url, params={})
      response = @conn.post do |req|
        req.url url
        req.headers['X-OTX-API-KEY'] = @key
        req.params = params
      end

      # Parse and return JSON object as hash to caller
      return Oj.load(response.body)
    end

    #
    # PATCH to the provided URL
    #
    # @param url [String] URL to make API request to
    # @param params [Hash] Additional parameters to be added to the requests
    #
    def patch(url, params={})
      response = @conn.patch do |req|
        req.url url
        req.headers['X-OTX-API-KEY'] = @key
        req.params = params
      end

      # Parse and return JSON object as hash to caller
      return Oj.load(response.body)
    end
  end
end

module OTX
  #
  # Base Data Types for Returned Data from API
  #
  # Implements two default handlers for created and modified timestamps as DataTime
  # objects
  #
  module Type
    #
    # Base Class for types
    #
    # @attr [DateTime] created Date and Time stamp for the creation of the records
    # @attr [DateTime] modified Date and Time stamp for the last modification of the records
    #
    class Base
      attr_writer :modified, :created
      attr_accessor :id

      def created
        return @created.nil? ? nil : DateTime.parse(@created)
      end

      def modified
        return @modified.nil? ? nil : DateTime.parse(@modified)
      end

      def initialize(attributes={})
        attributes.each do |key, value|
          _key = key.gsub('-', '_')

          unless self.respond_to?(_key.downcase)
            self.class.send(:attr_accessor, _key.downcase)
          end

          send("#{_key.downcase}=", value)
        end
      end
    end
  end
end
