class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :search_word
      t.integer :hatebu_count
      t.string :title
      t.string :url
      t.integer :twitter_user_id

      t.timestamps
    end
  end
end
