class User < ApplicationRecord
  has_secure_password

  has_many :conversations
  has_many :sentences, through: :conversations
  has_many :new_words, through: :conversations
  has_many :corrections, through: :sentences
  has_many :trouble_words, through: :corrections


  def get_formatted_trouble_words
    user.trouble_words.map { |tw| tw.corrected_word }
  end

end
