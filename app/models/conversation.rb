class Conversation < ApplicationRecord
  has_many :sentences
  has_many :new_words
  has_many :corrections, through: :sentences
  has_many :trouble_words, through: :corrections
  belongs_to :user


  # def trouble_word_definitions
  #   definitions = []
  #   trouble_words.each do |word|
  #     entries = Switchboard.get_definition(word)
  #     entries.each do |entry|
  #       definitions << entry.denotation
  #     end
  #   end
  #   definitions
  # end
end
