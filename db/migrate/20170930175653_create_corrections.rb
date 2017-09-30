class CreateCorrections < ActiveRecord::Migration[5.1]
  def change
    create_table :corrections do |t|
      t.text :corrected_sentence
      t.references :sentence

      t.timestamps
    end
  end
end
