require 'test_helper'

class CorrelationRuleTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('correlation_rule_general') do
      activity = OTX::CorrelationRule.new('test_api')

      all_activities = activity.get_general('572f8c3c540c6f0161677877')
    end
  end
end
