class AddColumnRegisterWordIdToSomeModel < ActiveRecord::Migration
  def change
    add_column :tweets, :register_word_id, :integer
    add_column :friends, :register_word_id, :integer
  end
end
