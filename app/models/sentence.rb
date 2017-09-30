class Sentence < ApplicationRecord
  belongs_to :conversation
  has_one :user, through: :conversation
  has_many :corrections
  has_many :trouble_words, through: :corrections

  after_save :sort_errors

  def sort_errors
    p response = Switchboard.gingerice_response(self.content)
    mistakes = response["corrections"]

    if mistakes.any?
      correction = Correction.create(corrected_sentence: response['result'], sentence: self)

      mistakes.each do |mistake|
        word = mistake['correct']
        TroubleWord.create(word: word, correction: correction)
      end
      return true

  end

end
