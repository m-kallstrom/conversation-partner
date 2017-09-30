class Correction < ApplicationRecord
  belongs_to :sentence
  has_many :trouble_words
  has_one :conversation, through: :sentence
  has_one :user, through: :conversation

  def format_response
    sentence_hash = corrected_sentence.split(" ")
    first_word = sentence_hash[0].capitalize
    remainder = sentence_hash[1..-1].join(' ')
    if first_word == "I"
      response = "Oh, you #{remainder}?"
    else
      response = "not an I statement"
    end
    response
  end

end
