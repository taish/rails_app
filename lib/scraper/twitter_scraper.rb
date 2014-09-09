module Scraper
  class TwitterScraper < BaseScraper
    def initialize(twitter_user)
      super
      @following = []
      @followers = []
      @id        = twitter_user.twitter_id
      @pass      = twitter_user.twitter_pass
      @logined   = false
      @before_friends_count = twitter_user.friends_count
      @before_followers_count = twitter_user.followers_count
    end

    def logined?
      @logined
    end
    # トップページ
    def login
      get 'https://twitter.com/'
      fill({id: "signin-email"}, @id)
      fill({id: "signin-password"}, @pass)
      click_text("ログイン",:button)
      @logined = true
    end

    # after login
    # followingを数える
    def following_list
      login unless logined?
      return @following if @following.present?
      get 'https://twitter.com/following'

      # follower % 18 回スクロール
      (@before_friends_count/18).times do
        scroll_bottom
        sleep 1
      end
      elements = find_elements({xpath:"//div[@data-test-selector='ProfileTimelineUser']/div/div/div/a"})
      elements.each do |f|
        user_name = f.attribute("href").gsub("https://twitter.com/", "@")
        # 古いやつが上にくる
        @following.unshift(user_name)
      end
      @following
    end

    # after login
    # followerを数える
    def followers_list
      login unless logined?
      return @followers if @followers.present?
      get 'https://twitter.com/followers'

      # follower % 18 回スクロール
      (@before_followers_count/18).times do
        scroll_bottom
        sleep 1
      end
      elements = find_elements({xpath:"//div[@data-test-selector='ProfileTimelineUser']/div/div/div/a"})
      elements.each do |f|
        user_name = f.attribute("href").gsub("https://twitter.com/", "@")
        # 古いやつが上にくる
        @followers.unshift(user_name)
      end
      @followers
    end

    def create_unfollow_list
      following_list - followers_list
    end
  end
end
