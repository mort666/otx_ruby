require 'test_helper'

class UsersTest < Minitest::Test
  def test_search
    VCR.use_cassette('user_general') do
      user = OTX::Users.new('test_api')

      user_search = user.search('AlienVault')
    end
  end

  # def test_subscribe_to
  #   VCR.use_cassette('user_general') do
  #     user = OTX::Users.new('test_api')

  #     user_subscribe_to = user.subscribe_to('AlienVault')
  #   end
  # end

  # def test_unsubscribe_from
  #   VCR.use_cassette('user_general') do
  #     user = OTX::Users.new('test_api')

  #     user_unsubscribe_from = user.unsubscribe_from('AlienVault')
  #   end
  # end

  # def test_follow
  #   VCR.use_cassette('user_general') do
  #     user = OTX::Users.new('test_api')

  #     user_follow = user.follow('AlienVault')
  #   end
  # end

  # def test_unfollow
  #   VCR.use_cassette('user_general') do
  #     user = OTX::Users.new('test_api')

  #     user_unfollow = user.unfollow('AlienVault')
  #   end
  # end
end
