require 'test_helper'

class OtxRubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::OTX::VERSION
  end

  def test_it_does_something_useful
    assert OTX::Pulse
  end
end
