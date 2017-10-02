class AddResponseToSentence < ActiveRecord::Migration[5.1]
  def change
    add_column :sentences, :response, :text
  end
end
