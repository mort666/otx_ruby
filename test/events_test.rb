require 'test_helper'

class EventsTest < Minitest::Test
  def test_get_activity
    VCR.use_cassette('events_get') do
      events = OTX::Events.new('test_api')

      e = events.get_events

      assert_equal 'subscribe', e.first.action
      assert_equal 'user', e.first.object_type
      assert_equal 1506106, e.first.id
      assert_equal 'AlienVault', e.first.object_id
    end
  end

  #
  # These can make giant af fixtures files...
  #
  # def test_get_all
  #   VCR.use_cassette('events_general') do
  #     events = OTX::Events.new('test_api')

  #     events_all = events.get_all
  #   end
  # end

  # def test_get_since
  #   VCR.use_cassette('events_since') do
  #     events = OTX::Events.new('test_api')

  #     events_since = events.get_since('2017-01-01T12:35:00+00:00')
  #   end
  # end
end
