require 'watson/conversation'

class LanguageHelper

  def self.craft_response(sentence, user)
    gingerice = Switchboard.gingerice_response(sentence)
    watson = Switchboard.watson_response(sentence, user)
    "Gingerice: #{gingerice['result']} ||| Watson: #{watson}"
  end

  def self.watson_says(input, user)
    watson = Switchboard.watson_response(input, user)
  end

  def self.greeting
    "Welcome Back -- [give word of the day]?"
  end

  def self.sort_errors(sentence)
    response = Switchboard.gingerice_response(sentence.content)
    mistakes = response["corrections"]

    if mistakes.any?
      correction = Correction.create(corrected_sentence: response['result'], sentence: sentence)

      mistakes.each do |mistake|
        allowed = ["i", "my"]
        word = mistake['correct'].split(" ").last
        if !allowed.include?(word.downcase) && word.length >= 4
          TroubleWord.create(corrected_word: word.downcase, correction: correction)
        end
      end
    end
  end

  def self.get_nouns(text)
    tgr = EngTagger.new
    tagged = tgr.add_tags(text)
    nouns = tgr.get_nouns(tagged).keys
  end


  def self.get_word_of_the_day(user)
    if user.trouble_words.empty?
      "No trouble words designated."
    else
      word = user.trouble_words.sample
      definition = word.definitions.first
      "Your word of the day is #{word.corrected_word}. The definition is '#{definition}'."
    end
  end

  def self.mention_trouble_word(user)
    return "Sign up for more information!" if user.nil?
    word = user.trouble_words.sample
    if word && word.definitions && word.definitions.any?
      p definition = word.definitions.first
      "Here is a word to review: #{word.corrected_word}. It means '#{definition}'."
    else
      "Here is a word to review: #{word.corrected_word}."
    end
  end


  def self.daily_word
    word = Switchboard.scrape_daily_word
    definition = get_primary_definition(word)
    output = "Your daily word is '#{word}. It means '#{definition}'."
  end

  def self.get_primary_definition(word)
    definitions = []
    entries = Switchboard.get_definition(word)
    entries.each do |entry|
      definitions << entry.denotation
    end
    definitions[0]
  end

  #errors are sorted here
  def self.process_response(sentence, user)
    if sentence.corrections.any?
      response = sentence.corrections[0].format_response
    else
      response = watson_says(sentence.content, user)
      if response.nil?
        response = mention_trouble_word(user)
      end
    end
    response
  end


end

  # def self.mention_trouble_words(user)
  #   words = user.get_formatted_trouble_words.uniq.sample(4)
  #   output = "Here are some words to review: "
  #   words.each do |word|
  #   output += "#{word}, "
  #   end
  #   output[0...-1] + "."
  # end


  #control the logic of the reponse
  #make all the API calls
  #Watson
  #Gingerice
  #get input from the user
    #send that input to Ginger Ice
    #get back and save Ginger Ice response

    #send Watson call
    #get back and save Watson response
