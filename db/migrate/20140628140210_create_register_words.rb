class CreateRegisterWords < ActiveRecord::Migration
  def change
    create_table :register_words do |t|
      t.string :word
      t.integer :registrable_id
      t.string :registrable_type

      t.timestamps
    end
  end
end
