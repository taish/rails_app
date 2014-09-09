class RegisterWord < ActiveRecord::Base
  belongs_to :twitter_user
end

class FriendWord < RegisterWord
  has_many :friends
end

class TweetWord < RegisterWord
  has_many :tweets
end
