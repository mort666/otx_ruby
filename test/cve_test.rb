require 'test_helper'

class CVETest < Minitest::Test
  def test_get_general
    VCR.use_cassette('cve_general') do
      cve = OTX::CVE.new('test_api')

      cve_general = cve.get_general('CVE-2014-0160')

      assert_equal 'CVE-2014-0160', cve_general.indicator
      assert_equal 'CWE-119', cve_general.cwe
      assert_equal 'public', cve_general.base_indicator.access_type
      assert_equal '563c17ae67db8c7a156ab753', cve_general.pulse_info.pulses.first.id
      assert_equal 'matthewssa', cve_general.pulse_info.pulses.first.author.username
      assert_equal 112, cve_general.references.count
    end
  end
end
