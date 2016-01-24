require 'test_helper'

class OtxRubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::OTX::VERSION
  end

  def test_it_does_something_useful
    assert OTX::Pulse
  end

  def test_if_pulse_valid
    VCR.use_cassette('one_pulse') do
      pulses = OTX::Pulses.new('test_api')

      pulse = pulses.get_pulse('55b13b6ab45ff52d687ccc3c')

      assert_equal '55b13b6ab45ff52d687ccc3c', pulse.id
      assert_equal 'AlienVault', pulse.author_name
      assert_equal 51, pulse.indicators.count
      assert_equal 'd59b2c7a28ae19ff2b85db9c2eeef29b', pulse.indicators[0].indicator
    end
  end

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
