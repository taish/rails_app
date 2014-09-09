class Batches::Unfollow::Unfollow100

  def self.execute
    twitter_users = TwitterUser.where(follower_size: 3)
    twitter_users.each do |twitter_user|
      ::ApiClient::Twitter::Unfollow::CreateUnfollowersService.execute({twitter_user: twitter_user})
    end
    Rails.logger.debug(self.class)
  end
end
