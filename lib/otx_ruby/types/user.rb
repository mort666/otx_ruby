module OTX
  #
  # AlienVault OTX User Record
  #
  # @attr user_id [String] User ID
  # @attr username [String] User name
  # @attr member_since [String] Number of days since User created their account
  # @attr avatar_url [String] URL for Users avatar image
  # @attr pulse_count [Integer] Number of Pulses created
  # @attr accepted_edits_count [Integer] Number of Users edits that have been accepted
  # @attr subscriber_count [Integer] Number of other Users subscribed to this User
  # @attr follower_count [Integer] Number of other Users following this User
  # @attr award_count [Integer] Number of awards this User has received
  # @attr awards [Array<String>] Array of awards this User has received
  #
  class User < OTX::Type::Base
    attr_accessor :user_id, :username, :member_since, :avatar_url, :pulse_count,
      :accepted_edits_count, :subscriber_count, :follower_count, :award_count,
      :awards
  end
end
