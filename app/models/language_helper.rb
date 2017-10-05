require 'watson/conversation'

class LanguageHelper

  def self.watson_says(input, user)
    watson = Switchboard.watson_response(input, user)
  end

  def self.sort_errors(sentence)
    return nil if sentence.content == ""
    if !sentence.asks_for_definition?
      response = Switchboard.gingerice_response(sentence.capitalize_content)
      p mistakes = response["corrections"]

      if mistakes.any?
        correction = Correction.create(corrected_sentence: response['result'], sentence: sentence)

        mistakes.each do |mistake|
          allowed = ["i", "my"]

          word = LanguageHelper.strip_punctuation(mistake['correct'].split(" ").last)
          if !allowed.include?(word.downcase) && word.length >= 4 && mistake['text'].capitalize != mistake['correct']
            TroubleWord.create(corrected_word: word.downcase, correction: correction)
          end
        end
      end
    end
  end

  def self.strip_punctuation(txt)
    marks = [".", "?", "!"]
    if marks.include?(txt[-1])
      result = txt.scan(/.*(?=.)/).first
    else
      result = txt
    end
  end

  # returns array of nouns
  def self.get_nouns(text)
    tgr = EngTagger.new
    tagged = tgr.add_tags(text)
    nouns = tgr.get_nouns(tagged).keys
  end

  def self.mention_trouble_word(user)
    return "Sign up to see all your conversations!" if user.nil?
    word = user.trouble_words.sample
    if word && word.definitions && word.definitions.any?
      definition = word.definitions.first
      "Try using this word in a sentence: #{word.corrected_word}. It means '#{definition}'."
    else
      return "JOKE ROUTE" if word.nil?
      "Try using this word in a sentence: #{word.corrected_word}."
    end
  end

  def self.daily_word
    word_definition = Switchboard.scrape_daily_word
    word = word_definition[0]
    definition = word_definition[1]
    NewWord.create(word: word, definition: definition)
    output = "Your daily word is '#{word} #{definition}'."
  end

  def self.news_item
    headline = Switchboard.scrape_news
    "Here is something I read in the paper: '#{headline}'. What do you think?"
  end

  def self.get_primary_definition(word)
    definitions = []
    entries = Switchboard.get_definition(word)
    entries.each do |entry|
      definitions << entry.denotation
    end
    definitions[0]
  end

  def self.process_response(sentence, user)
    if sentence.asks_for_definition?
      response = sentence.define_user_word
    else
      if sentence.corrections.any?
        g_response = sentence.corrections[0].format_response
        w_response = watson_says(sentence.corrections[0].corrected_sentence, user)
        response = "#{g_response} #{w_response}"
      else
        response = watson_says(sentence.content, user)
      end
    end
    response
  end

end
