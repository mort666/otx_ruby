require 'test_helper'

class ActivityTest < Minitest::Test
  def test_get_activity
    VCR.use_cassette('activity_get') do
      activity = OTX::Activity.new('test_api')

      all_activities = activity.get_activity
      a = all_activities.first

      all_activities.each do |pulse|
        assert_equal OTX::Pulse, a.class
      end
      assert_equal 'Muddying the Water: Targeted Attacks in the Middle East', a.name
      assert_equal '12a7898fe5c75e0b57519f1e7019b5d09f5c5cbe49c48ab91daf6fcc09ee8a30', a.indicators.first.indicator
      assert_equal 'AlienVault', a.author_name
      assert a.tags.include? 'MuddyWater'
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
