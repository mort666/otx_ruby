require 'test_helper'

class CorrelationRuleTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('correlation_rule_general') do
      correlation_rule = OTX::CorrelationRule.new('test_api')

      cr = correlation_rule.get_general('572f8c3c540c6f0161677877')

      assert_equal '572f8c3c540c6f0161677877', cr.indicator
      assert_nil cr.cve
      assert cr.sections.include? 'general'
      assert_equal 0, cr.pulse_info.count
    end
  end
end
