class Correction < ApplicationRecord
  belongs_to :sentence
  has_many :trouble_words
  has_one :conversation, through: :sentence
  has_one :user, through: :conversation

  def format_response

    # get nouns to check
    noun_ary = LanguageHelper.get_nouns(corrected_sentence)

     #replace my with your for response
    sentence_hash = handle_punctuation.split(" ").map!{|word| word.downcase == "my" ? 'your' : word }

    first_word = sentence_hash[0]
    last_word = sentence_hash[-1]
    remainder = sentence_hash[1..-1].join(' ')

    #Handle common I and My statements
    if first_word.downcase == "i"
      if sentence_hash[1] == "am"
        remainder = sentence_hash[2..-1].join(' ')
        if noun_ary.include?(last_word)
          response = "Oh you are #{remainder}? Tell me more about that."
        else
          response = "Oh you are #{remainder}? Tell me more about it."
        end
      else
        response = "Oh, you #{remainder}?"
      end
    elsif first_word.downcase == "my"
      response = "Oh, you say your #{remainder}?"
    else
      remainder = first_word.downcase + " " + remainder
      response = "So, you say #{remainder}?"
    end
    response
  end


  def handle_punctuation
    marks = [".", "?", "!"]
    if marks.include?(corrected_sentence[-1])
      result = corrected_sentence.scan(/.*(?=.)/).first
    else
      result = corrected_sentence
    end
  end


end
