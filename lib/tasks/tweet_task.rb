require 'rss'
class Tasks::TweetTask

  # アンフォローリストの最初から10件づつ削除
  def self.execute
    loop do
      TwitterUser.all.find_each do |twi_user|
        if twi_user.tweet_lists.blank?
          twi_user.tweet_words.pluck(:word).each do |word|
            escape_word = URI.escape(word)
            url = "http://b.hatena.ne.jp/t/#{escape_word}?sort=recent&threshold=10&mode=rss"
            rss = RSS::Parser.parse(url)
            rss.items.first(3).each do |item|
              tweet_list = twi_user.tweet_lists.build
              tweet_list.title = item.title
              tweet_list.url = item.link
              tweet_list.save!
            end
          end
        else
          tweet = twi_user.tweet_lists.first
          unless tweet.destroy
            break
          else
            twitter = Api::ApiClient::Twitter.new(twi_user.access_token, twi_user.access_token_secret)
            twitter.tweet(tweet.title + tweet.url)
          end
        end
      end
      # 11分ごとに1人フォロー、一日130人
      sleep 6 * 60 * 60
    end
  end
end
