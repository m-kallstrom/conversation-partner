class Conversation < ApplicationRecord
  has_many :trouble_words
  has_many :sentences
  belongs_to :user


  def trouble_word_definitions
    definitions = []
    trouble_words.each do |word|
      entries = Switchboard.get_definition(word)
      entries.each do |entry|
        definitions << entry.denotation
      end
    end
    definitions
  end
end
