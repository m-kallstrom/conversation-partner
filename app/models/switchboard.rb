class Switchboard

  #returns string
  def self.watson_response(sentence, user)
    response = call_watson(sentence, user)
    json = JSON.parse(response)
    json['output'][0]
  end

  # returns hash
  def self.gingerice_response(sentence)
    parser = Gingerice::Parser.new
    parser.parse sentence
  end

  def self.get_definition(word)
    results = DictionaryLookup::Base.define(word)
  end

  # def self.oxford_dictionary_response(word)
  #   client = call_dictionary
  #   entry = client.entry[word]
  #   entry.lexical_entries.entries.senses
  # end

private

  def self.load_watson
    manage = Watson::Conversation::ManageDialog.new(username: ENV['W_USERNAME'], password: ENV['W_PASSWORD'], workspace_id: ENV['W_WORKSPACE_ID'], storage: 'hash')
  end

  #returns JSON object
  def self.call_watson(sentence, user)
    watson = load_watson
    init_response = watson.talk("user#{user.id}", "Hi")
    response = watson.talk("user#{user.id}", sentence)
  end

  def self.call_oxford_dictionary
    client = OxfordDictionary::Client.new(ENV['OXFORD_API_ID'], app_key: ENV['OXFORD_API_KEY']
    client = OxfordDictionary.new(ENV['OXFORD_API_ID'], app_key: ENV['OXFORD_API_KEY']
  end


#Add dictionary API call
#Add top new API call

end
