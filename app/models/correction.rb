class Correction < ApplicationRecord
  belongs_to :sentence
  has_many :trouble_words
  has_one :conversation, through: :sentence
  has_one :user, through: :conversation
end
