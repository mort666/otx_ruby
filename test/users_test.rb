require 'test_helper'

class UsersTest < Minitest::Test
  def test_search
    VCR.use_cassette('user_general') do
      user = OTX::Users.new('test_api')

      u = user.search('AlienVault')

      assert_equal '4979-AlienVault', u.first.username
      assert_equal 0, u.first.pulse_count
      assert_equal 45001, u.first.user_id
      assert_equal 0, u.first.subscriber_count
      assert_equal '13 days ago ', u.first.member_since
      assert_equal 0, u.first.award_count
      assert_equal 'https://otx.alienvault.com/static/img/default.png', u.first.avatar_url
      assert u.first.awards.empty?
      assert_equal 0, u.first.follower_count
      assert_equal 0, u.first.accepted_edits_count

      assert_equal 'AlienVault-OTX', u.last.username
      assert_equal 0, u.last.pulse_count
      assert_equal 14572, u.last.user_id
      assert_equal 2, u.last.subscriber_count
      assert_equal '552 days ago ', u.last.member_since
      assert_equal 0, u.last.award_count
      assert_equal 'https://otx.alienvault.com/static/img/default.png', u.last.avatar_url
      assert u.last.awards.empty?
      assert_equal 0, u.last.follower_count
      assert_equal 0, u.last.accepted_edits_count
    end
  end
end
