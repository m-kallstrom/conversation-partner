class Sentence < ApplicationRecord
  belongs_to :conversation
  has_one :user, through: :conversation
  has_many :corrections
  has_many :trouble_words, through: :corrections

  before_save :capitalize_content


  def capitalize_content
    if content.length > 0
      ary = content.split(" ")
      ary[0] = ary[0].capitalize
      self.content = ary.join(" ")
    end
  end

  def asks_for_definition?
    content.split(" ")[0..1].join(" ").downcase == "what is"
  end

  def define_user_word
    ignore_words = ["a", "an", "the", "my", "his", "her"]
    words = []
    LanguageHelper.strip_punctuation(content).split(" ")[2..3].each do |word|
      words << word unless ignore_words.include?(word)
    end
    word_to_define = words[0]
    definition = LanguageHelper.get_primary_definition(word_to_define)
    if definition
      "#{word_to_define}: '#{definition}'."
    else
      "I can't find that word in my dictionary."
    end
  end

end
