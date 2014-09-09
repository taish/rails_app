class TwitterUser < ActiveRecord::Base

  belongs_to :user
  has_many :friends, dependent: :delete_all
  has_many :unfollowers, dependent: :delete_all
  has_many :tweets, dependent: :delete_all
  has_many :register_words, dependent: :delete_all

  # フォロワー1000以下	４０フォロー & アンフォロー/１日
  # フォロワー1000~3000	６０フォロー & アンフォロー/１日
  # フォロワー3000~5000	８０フォロー & アンフォロー/１日
  # フォロワー5000~10000	１００フォロー & アンフォロー/１日
  # フォロワー10000以上	１５０フォロー & アンフォロー/１日
  enum follower_size: %i(less_than_1000 _1001_to_3000 _3001_to_5000 _5001_to_10000 more_than_10000)
  enum tweet_frequency: %i(per_1hour per_2hour per_4hour per_8hour per_12hour per_24hour)

  def self.create_with_omniauth(auth, current_user)
    twitter_user = create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.friends_count = auth['extra']['raw_info']['friends_count']
      user.followers_count = auth['extra']['raw_info']['followers_count']
      user.profile_image_url = auth['info']['image']
      user.access_token = auth['credentials']['token']
      user.access_token_secret = auth['credentials']['secret']
      user.user_id = current_user.id
    end
    twitter_user.update_follower_size
  end

  def update_follower_size
    self.follower_size =
    if self.followers_count < 1000
      :less_than_1000
    elsif self.followers_count < 3000
      :_1001_to_3000
    elsif self.followers_count < 5000
      :_3001_to_5000
    elsif self.followers_count < 10000
      :_5001_to_10000
    elsif self.followers_count > 10000
      :more_than_10000
    end
    self.save!
  end
end
