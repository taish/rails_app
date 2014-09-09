class ChangeColumnFromTwitterUser < ActiveRecord::Migration
  def change
    add_column :twitter_users, :friends_count, :integer
    add_column :twitter_users, :followers_count, :integer
    remove_column :twitter_users, :follewer_count
    remove_column :twitter_users, :friend_count
  end
end
