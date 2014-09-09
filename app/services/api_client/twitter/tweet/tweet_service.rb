require 'rss'

class ApiClient::Twitter::Tweet::TweetService < BaseService

  def initialize(args={})
    @twitter_user = args[:twitter_user]
    arg_valid?
  end

  def run
    if @twitter_user.register_words.where(type: "TweetWord").blank?
      Rails.logger.error("#{@twitter_user} don't have register_word")
      return
    end

    create_tweets if @twitter_user.tweets.blank?
    tweet
  end

  def tweet
    api_client
    tweet = @twitter_user.tweets.all.first
    @api_client.tweet(tweet.title + tweet.url) if tweet.destroy
  end


  private

    def create_tweets
      @twitter_user.register_words.where(type: "TweetWord").each do |word|
        hatebu_word = URI.escape(word.word)
        hatebu_count = URI.escape('50')
        url = "http://b.hatena.ne.jp/t/#{hatebu_word}?sort=hot&threshold=#{hatebu_count}&mode=rss"
        rss = RSS::Parser.parse(url)
        item = rss.items.first
        @twitter_user.tweets.create(title: item.title, url: item.link, register_word: word)
      end
    end

    def api_client
      @api_client = ::Api::ApiClient::Twitter.new(@twitter_user.access_token, @twitter_user.access_token_secret)
    end

    def arg_valid?
      raise LackOfArgsError if @twitter_user.nil?
    end
end
