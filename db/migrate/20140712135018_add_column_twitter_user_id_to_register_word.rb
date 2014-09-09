class AddColumnTwitterUserIdToRegisterWord < ActiveRecord::Migration
  def change
    add_column :register_words, :twitter_user_id, :integer
  end
end
