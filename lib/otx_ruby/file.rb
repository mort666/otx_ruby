module OTX
  class File < OTX::Base
    def get_general(file_hash)
      uri = "/api/v1/indicators/file/#{file_hash}/general"

      json_data = get(uri)

      general = OTX::Indicator::IP::General.new(json_data)

      return general
    end

    def get_analysis(file_hash)
      uri = "/api/v1/indicators/file/#{file_hash}/analysis"

      json_data = get(uri)

      analysis = OTX::Indicator::FileAnalysis.new(json_data)

      return analysis
    end
  end
end
