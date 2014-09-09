class ApiClient::Twitter::Follow::CreateFollowersService < BaseService

  def initialize(args={})
    @twitter_user = args[:twitter_user]
    arg_valid?
    @api_client = ::Api::ApiClient::Twitter.new(@twitter_user.access_token, @twitter_user.access_token_secret)
  end

  def run
    if @twitter_user.register_words.where(type: "FriendWord").blank?
      Rails.logger.error("#{@twitter_user} don't have register_word")
      return
    end
    create_friends if @twitter_user.friends.blank?
    follow
  end

  def follow
    friend = @twitter_user.friends.all.first
    @api_client.follow(friend.screen_name) if friend.destroy
  end

  private

    def create_friends
      @twitter_user.register_words.where(type: "FriendWord").each do |word|
        params_array = @api_client.search(word.word, count: 3)
        params_array.each do |params|
          friend = Friend.new(params)
          friend.register_word = word
          friend.twitter_user = @twitter_user
          friend.save
        end
      end
    end

    def arg_valid?
      raise LackOfArgsError if @twitter_user.nil?
    end
end
