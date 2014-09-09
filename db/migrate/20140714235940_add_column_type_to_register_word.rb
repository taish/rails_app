class AddColumnTypeToRegisterWord < ActiveRecord::Migration
  def change
    add_column :register_words, :type, :string
  end
end
