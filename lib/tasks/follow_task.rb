class Tasks::FollowTask

  # アンフォローリストの最初から10件づつ削除
  def self.execute
    loop do
      TwitterUser.all.find_each do |twi_user|
        twitter = Api::Service::Twitter.new(twi_user.access_token, twi_user.access_token_secret)
        search_words = twi_user.search_words.pluck(:word)

        if search_words.present?
          search_words.each do |word|
            twitter.user_list(word).each do |user|
              add_follow_lists(twi_user, user)
            end
          end
        end

        following = twi_user.follow_lists.first
        unless following.blank?
          if following.destroy
            begin
              twitter = Api::ApiClient::Twitter.new(twi_user.access_token, twi_user.access_token_secret)
              twitter.follow(following.screen_name)
            rescue Twitter::Error::Forbidden
              Rails::Rack::Logger.logger.info("You are unable to follow more people at this time")
            end
          end
        end
      end
      # 11分ごとに1人フォロー、一日130人
      sleep 11 * 60
    end
  end

  def self.add_follow_lists(me, you)
    unless you[:following]
      me.follow_lists.create(
        name: you[:name],
        screen_name: you[:screen_name],
        description: you[:description],
        profile_image_url: you[:profile_image_url],
        friends_count: you[:friends_count],
        followers_count: you[:followers_count]
      )
    end
  end
end
