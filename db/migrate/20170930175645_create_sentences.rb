class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.text :content
      t.references :conversation

      t.timestamps
    end
  end
end
