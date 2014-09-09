class Batches::Tweet::Tweet3

  def self.execute
    twitter_users = TwitterUser.all
    twitter_users.each do |twitter_user|
      ::ApiClient::Twitter::Tweet::TweetService.execute({twitter_user: twitter_user})
    end
    Rails.logger.debug(self.class)
  end
end
