class CreateTroubleWords < ActiveRecord::Migration[5.1]
  def change
    create_table :trouble_words do |t|
      t.string :corrected_word
      t.references :correction

      t.timestamps
    end
  end
end
