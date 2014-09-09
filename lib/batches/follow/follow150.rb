class Batches::Follow::Follow150
  def self.execute
    twitter_users = TwitterUser.where(follower_size: 4)
    twitter_users.each do |twitter_user|
      ::ApiClient::Twitter::Follow::CreateFollowersService.execute({twitter_user: twitter_user})
    end
    Rails.logger.debug(self.class)
  end
end
