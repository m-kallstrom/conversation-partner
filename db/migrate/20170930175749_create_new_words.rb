class CreateNewWords < ActiveRecord::Migration[5.1]
  def change
    create_table :new_words do |t|
      t.string :word
      t.string :definition
      t.references :conversation

      t.timestamps
    end
  end
end
