class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :uid
      t.string :name
      t.string :screen_name
      t.string :description
      t.string :profile_image_url
      t.integer :friends_count
      t.integer :followers_count
      t.integer :twitter_user_id
      t.boolean :following

      t.timestamps
    end
  end
end
