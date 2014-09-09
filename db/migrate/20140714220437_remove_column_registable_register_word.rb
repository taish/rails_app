class RemoveColumnRegistableRegisterWord < ActiveRecord::Migration
  def change
    remove_column :register_words, :registrable_id, :integer
    remove_column :register_words, :registrable_type, :string
  end
end
