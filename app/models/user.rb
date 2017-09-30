class User < ApplicationRecord

  has_many :conversations
  has_many :sentences, through: :conversations
  has_many :new_words, through: :conversations
  has_many :corrections, through: :sentences
  has_many :trouble_words, through: :corrections

end
