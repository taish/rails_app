class Tweets::BuildHatebusService < BaseService

  def initialize(args={})
    @twitter_user = args[:twitter_user]
    @register_word = args[:register_word]
    # default
    @hatebu_count = '50'
  end

  def run
    service.build
  end

  def build
    word = URI.escape(@register_word.word)
    hatebu_count = URI.escape(@hatebu_count)
    url = "http://b.hatena.ne.jp/t/#{word}?sort=hot&threshold=#{hatebu_count}&mode=rss"
    rss = RSS::Parser.parse(url)
    rss.items.reduce([]) do |tweets, item|
      tweets << @twitter_user.tweets.build(title: item.title, url: item.link, register_word: @register_word)
    end
  end
end
