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
        word = mistake['correct']
        TroubleWord.create(corrected_word: word, correction: correction)
      end
    end
    # return true
  end

  def self.get_nouns(text)
    tgr = EngTagger.new
    tagged = tgr.add_tags(text)
    nouns = tgr.get_nouns(tagged).keys
  end


  def self.mention_trouble_word(user)
    word = user.get_formatted_trouble_words.sample
    output = "Here is a word to review: #{word}."
  end

  # def self.mention_trouble_words(user)
  #   words = user.get_formatted_trouble_words
  #   output = "Here are some words to review: "
  #   words.each do |word|
  #   output += "#{word}, "
  #   end
  #   output[0...-1] + "."
  # end


end

  #control the logic of the reponse
  #make all the API calls
  #Watson
  #Gingerice
  #get input from the user
    #send that input to Ginger Ice
    #get back and save Ginger Ice response

    #send Watson call
    #get back and save Watson response
