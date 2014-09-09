class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.integer :friend_count
      t.integer :follewer_count
      t.string :access_token
      t.string :access_token_secret
      t.string :uid
      t.string :profile_image_url
      t.string :screen_name
      t.string :provider
      t.integer :user_id

      t.timestamps
    end
  end
end
