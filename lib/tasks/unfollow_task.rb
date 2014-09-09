class Tasks::UnfollowTask
  # アンフォローリストの最初から10件づつ削除
  def self.execute

    loop do
      TwitterUser.all.find_each do |twi_user|
        # twitter_idはボタン押してるかどうかtrue or false
        if twi_user.twitter_id.present?
          if twi_user.unfollow_lists.blank?

            twitter = Api::ApiClient::Twitter.new(twi_user.access_token, twi_user.access_token_secret)
            follower_ids, friend_ids = twitter.follower_ids, twitter.friend_ids
            unfollow_ids = friend_ids - follower_ids

            twi_user.followers_count = follower_ids.count
            twi_user.friends_count = friend_ids.count
            twi_user.save!

            unfollower_ids.each do |unfollower_id|
              twi_user.unfollow_lists.create(screen_name: unfollower_id)
            end
          end

          unfollower = twi_user.unfollow_lists.first
          twitter.unfollow(unfollower.screen_name) if unfollower.try(:destroy)
        end
      end
      # 11分ごとに1人アンフォロー、一日130人
      sleep 11 * 60
    end
  end
end
