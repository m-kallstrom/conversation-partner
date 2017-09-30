class TroubleWord < ApplicationRecord
  belongs_to :correction
  has_one :sentence, through: :correction
  has_one :conversation, through: :sentence
  has_one :user, through: :conversation
end
