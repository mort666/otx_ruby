require 'test_helper'

class ActivityTest < Minitest::Test
  def test_get_activity
    VCR.use_cassette('activity_get') do
      activity = OTX::Activity.new('test_api')

      all_activities = activity.get_activity
    end
  end

  #
  # These make giant af fixtures files...
  #
  # def test_get_all
  #   VCR.use_cassette('activity_all') do
  #     activity = OTX::Activity.new('test_api')

  #     all_activities = activity.get_all
  #   end
  # end

  # def test_get_since
  #   VCR.use_cassette('activity_since') do
  #     activity = OTX::Activity.new('test_api')

  #     activities_since = activity.get_since('2017-01-01T12:35:00+00:00')
  #   end
  # end
end
