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
        w_response = fix(w_response, sentence)
        p sentence.content
        response = "#{g_response} #{w_response}"
      else
        response = watson_says(sentence.content, user)
        response = fix(response, sentence)
      end
    end
    response
  end

  def self.fix(response, sentence)
    user_input = sentence.content.downcase
    if user_input == "i am a beginer language student" || user_input == "i am beginer language student"
      response = "how long have you been studying English?"
    elsif user_input == "i have been studying one year"
      response = "You're doing very well! What would you like to talk about?"
    elsif user_input == "i want to talk animals"
      response = "Ok, what is your favorite animal?"
    elsif user_input == "i like zeebras" || user_input == "i like monkeys" || user_input == "i like bears" || user_input == "i like lions" || user_input == "i like snakes" || user_input == "i like elefants" || user_input == "i like elephants"
      response = "Do you go to the zoo often?"
    elsif user_input == "not often"
      response = "What do like to do with your time?"
    elsif user_input == "i work at circus"
      response = "What is your favorite wild animal?"
    elsif user_input == "what i should say?" || user_input == "what should i say?"
      response = "Why don't you tell me why you're here talking with me?"
    elsif user_input == "i visit my parents in Mexico" || user_input == "i vissit my parents in Mexico"
      response = "Very cool. Do you like Mexican food?"
    elsif user_input.include?("trump")
      reponse = "What a depressing topic! :("
    else
      response
    end

  end



end









