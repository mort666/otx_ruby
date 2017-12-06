module OTX
  class CorrelationRule < OTX::Base
    def get_general(correlation_rule)
      uri = "/api/v1/indicators/correlation-rule/#{correlation_rule}/general"

      json_data = get(uri)

      general = OTX::Indicator::CorrelationRule.new(json_data)

      return general
    end
  end
end
