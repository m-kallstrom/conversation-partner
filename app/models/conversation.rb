class Conversation < ApplicationRecord
  has_many :sentences
  has_many :new_words
  has_many :corrections, through: :sentences
  has_many :trouble_words, through: :corrections
  belongs_to :user, optional: true
end
