class Tweets::CreateService < BaseService

  def initialize(args={})
    @params = params[:params]
    @search_word = params[:search_word]
    @hatebu_count = params[:hatebu_count]
    @twitter_user = options[:twitter_user]
    @register_word = options[:register_word]
  end

  def run
    create
  end

  def create
    @tweet = @twitter_user.tweets.create(title: @params[:title], url: @params[:url], register_word: @register_word)
  end


end
