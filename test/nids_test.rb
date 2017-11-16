require 'test_helper'

class NIDSTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('nids_general') do
      nids = OTX::NIDS.new('test_api')

      nids_general = nids.get_general('2820184')
    end
  end
end
