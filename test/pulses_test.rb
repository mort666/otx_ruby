require 'test_helper'

class PulsesTest < Minitest::Test
  # def test_create
  #   VCR.use_cassette('pulse_create') do
  #     pulse = OTX::Pulses.new('test_api')
  #
  #     pulse_create = pulse.create(params)
  #   end
  # end

  # def test_validate_indicator
  #   VCR.use_cassette('pulse_validate_indicator') do
  #     pulse = OTX::Pulses.new('test_api')
  #   end
  # end

  def test_get_pulse
    VCR.use_cassette('pulse_get') do
      pulse = OTX::Pulses.new('test_api')

      pulse_get = pulse.get_pulse('57204e9b3c4c3e015d93cb12')
    end
  end
  
  def test_search
    VCR.use_cassette('pulse_search') do
      pulse = OTX::Pulses.new('test_api')

      pulse_search = pulse.search('AlienVault')
    end
  end

  # def test_edit
  #   VCR.use_cassette('pulse_get') do
  #     pulse = OTX::Pulses.new('test_api')
  #
  #     pulse_edit = pulse.edit('57204e9b3c4c3e015d93cb12', params)
  #   end
  # end

  def test_get_user_pulses
    VCR.use_cassette('pulse_user_pulses') do
      pulse = OTX::Pulses.new('test_api')

      user_pulses = pulse.get_user_pulses('AlienVault')
    end
  end

  def test_get_related
    VCR.use_cassette('pulse_related') do
      pulse = OTX::Pulses.new('test_api')

      pulse_related = pulse.get_related('57204e9b3c4c3e015d93cb12')
    end
  end

  def test_get_indicators
    VCR.use_cassette('pulse_indicators') do
      pulse = OTX::Pulses.new('test_api')

      pulse_indicators = pulse.get_indicators('57204e9b3c4c3e015d93cb12')
    end
  end

  def test_get_indicator_types
    VCR.use_cassette('pulse_indicator_types') do
      pulse = OTX::Pulses.new('test_api')

      pulse_indicator_types = pulse.get_indicator_types
    end
  end
end
