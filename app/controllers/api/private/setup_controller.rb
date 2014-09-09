# sample api
module Api::Private
  class SetupController < ApiController
    def setup_data
      @twitter_users = current_user.twitter_users.includes(tweets: :register_words, friends: :register_words)
    end
  end
end
