class Tweet < ActiveRecord::Base
  belongs_to :register_word
  belongs_to :twitter_user
end
