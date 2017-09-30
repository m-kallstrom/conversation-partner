class TroubleWord < ApplicationRecord
  belongs_to :correction
  has_one :sentence, through: :correction
  has_one :conversation, through: :sentence
  has_one :user, through: :conversation

  def definitions
    definitions = []
    entries = Switchboard.get_definition(word)
    entries.each do |entry|
      definitions << entry.denotation
    end
    definitions
  end

end
