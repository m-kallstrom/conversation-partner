class Sentence < ApplicationRecord
  belongs_to :conversation
  has_one :user, through: :conversation
  has_many :corrections
  has_many :trouble_words, through: :corrections

  before_save :capitalize_content


  def capitalize_content
    ary = content.split(" ")
    ary[0] = ary[0].capitalize
    self.content = ary.join(" ")
  end

end
