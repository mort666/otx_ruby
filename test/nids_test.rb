require 'test_helper'

class NIDSTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('nids_general') do
      nids = OTX::NIDS.new('test_api')

      n = nids.get_general('2820184')

      assert_equal '2820184', n.indicator
      assert_equal '2820184', n.base_indicator.indicator
      assert_equal 0, n.pulse_info.count
      assert_equal 'Suspicious Activity', n.category
      assert_equal 'Webshell', n.subcategory
      assert_equal 'IndoXploit Shell Uploader Inbound', n.name
    end
  end
end
