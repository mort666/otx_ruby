require 'test_helper'

class SubscribedTest < Minitest::Test
  def test_subscribers
    VCR.use_cassette('subscibed') do
      subscibed = OTX::Subscribed.new('test_api')

      pulses = subscibed.get_all

      assert_equal '56a3cbf84637f23551f3be3c', pulses[0].id
      assert_equal 'AlienVault', pulses[1].author_name
      assert_equal 5, pulses[1].indicators.count
      assert_equal '920eb07bc8321ec6de67d02236cf1c56a90fea7d', pulses[1].indicators[0].indicator
    end
  end
end
