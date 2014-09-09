class AddColumnToTwitterUser < ActiveRecord::Migration
  def change
    add_column :twitter_users, :follower_size, :integer
    add_column :twitter_users, :tweet_frequency, :integer
  end
end
