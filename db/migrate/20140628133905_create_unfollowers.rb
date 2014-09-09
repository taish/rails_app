class CreateUnfollowers < ActiveRecord::Migration
  def change
    create_table :unfollowers do |t|
      t.integer :uid
      t.integer :twitter_user_id
      t.boolean :following

      t.timestamps
    end
  end
end
