require 'watson/conversation'

  #control the logic of the reponse
  #make all the API calls
  #Watson
  #Gingerice
  #get input from the user
    #send that input to Ginger Ice
    #get back and save Ginger Ice response

    #send Watson call
    #get back and save Watson response

class LanguageHelper

  def self.craft_response(sentence, user)
    gingerice = Switchboard.gingerice_response(sentence)
    watson = Switchboard.watson_response(sentence, user)
    "Gingerice: #{gingerice['result']} ||| Watson: #{watson}"
  end


end
