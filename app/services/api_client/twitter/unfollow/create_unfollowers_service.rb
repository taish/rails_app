class ApiClient::Twitter::Unfollow::CreateUnfollowersService < BaseService

  def initialize(args={})
    @twitter_user = args[:twitter_user]
    arg_valid?
    @api_client = ::Api::ApiClient::Twitter.new(@twitter_user.access_token, @twitter_user.access_token_secret)
  end

  def execute
    create_unfollowers if @twitter_user.unfollowers.blank?
    unfollow
  end

  def unfollow
    unfollower = @twitter_user.unfollowers.first
    @api_client.unfollow(unfollower.uid) if unfollower.destroy
  end

  private

    def create_unfollowers
      follower_ids = @api_client.follower_ids
      friend_ids = @api_client.friend_ids
      unfollow_ids = friend_ids - follower_ids
      unfollow_ids.each do |uid|
        @twitter_user.unfollowers.create(uid: uid.to_s)
      end
    end

    def arg_valid?
      raise LackOfArgsError if @twitter_user.nil?
    end
end
