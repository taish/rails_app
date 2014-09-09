class Friends::CreateService < BaseService

  def initialize(args={})
    @params = args[:params]
    @twitter_user = args[:twitter_user]
    @register_word = args[:register_word]
  end

  def run
    create
    @tweet
  end

  def create
    @tweet = @twitter_user.friends.build(@params)
    @tweet.register_word = @register_word
    @tweet.save
  end

end
