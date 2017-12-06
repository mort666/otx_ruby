module OTX
  #
  # Search for, subscribe to, unsubscribe from, follow and unfollow users
  #
  class Users < OTX::Base
    #
    # Validate your API Key configuration. If valid, some basic information about the user account corresponding to the API Key supplied will be returned.
    #
    # @return [OTX::User] Parsed User
    #
    def me
      uri = "/api/v1/users/me"

      json_data = get(uri)

      user = OTX::User.new(json_data)

      return user
    end

    #
    # Search for Users by username
    #
    # @param query [String] Full or partial username to search
    # @param limit [Integer] Limit results per page to this number
    # @param page [Integer] Return results for this page
    # @param sort [Symbol] Sort results by username or pulse_count
    # @return [Array<OTX::User>] Parsed Users
    #
    def search(query, limit = 10, page = 1, sort = :username)
      uri = '/api/v1/search/users'
      params = {
        q: query,
        limit: limit,
        page: page,
        sort: sort == :pulse_count ? 'pulse_count' : 'username'
      }
      results = []

      json_data = get(uri, params)

      json_data['results'].each do |user|
        results << OTX::User.new(user)
      end

      return results
    end

    #
    # Subscribe to a User
    #
    # @param useranme [String] Username of the User you wish to subscribe to
    #
    def subscribe_to(username)
      action(username, 'subscribe')
    end

    #
    # Unsubscribe from a User
    #
    # @param useranme [String] Username of the User you wish to unsubscribe from
    #
    def unsubscribe_from(username)
      action(username, 'unsubscribe')
    end

    #
    # Follow a User
    #
    # @param useranme [String] Username of the User you wish to follow
    #
    def follow(username)
      action(username, 'follow')
    end

    #
    # Unfollow a User
    #
    # @param useranme [String] Username of the User you wish to unfollow
    #
    def unfollow(username)
      action(username, 'unfollow')
    end

    #
    # Perform an action on a User
    #
    # @param useranme [String] Username of the User you wish to perform an action on
    # @param action [String] Action you wish to perform on the User
    #
    def action(username, action)
      uri = "/api/v1/users/#{username}/#{action}"

      post(uri)
    end
  end
end
