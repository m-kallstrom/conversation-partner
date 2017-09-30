class User < ApplicationRecord

  has_many :conversations
  has_many :trouble_words
  has_many :sentences, through: :conversations

end
