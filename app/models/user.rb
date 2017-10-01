class User < ApplicationRecord
  has_secure_password

  has_many :conversations
  has_many :sentences, through: :conversations
  has_many :new_words, through: :conversations
  has_many :corrections, through: :sentences
  has_many :trouble_words, through: :corrections


  def get_formatted_trouble_words
    all_words = trouble_words.map { |tw| tw.corrected_word }
    longer_words = all_words.select { |word| word.length >= 4 }.uniq.sample(4)
  end

end
