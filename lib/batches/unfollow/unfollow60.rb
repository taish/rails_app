class Batches::Unfollow::Unfollow60

  def self.execute
    twitter_users = TwitterUser.where(follower_size: 1)
    twitter_users.each do |twitter_user|
      ::ApiClient::Twitter::Unfollow::CreateUnfollowersService.execute({twitter_user: twitter_user})
    end
    Rails.logger.debug(self.class)
  end
end
