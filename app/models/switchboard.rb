require 'net/http'
require 'rss'

class Switchboard

  #returns string
  def self.watson_response(sentence, user)
    response = call_watson(sentence, user)
    json = JSON.parse(response)
    response = json['output'][0]
    if response.nil? || response == "trouble_word"
      response = LanguageHelper.mention_trouble_word(user)
    elsif response == "news_item"
      response = LanguageHelper.news_item
    elsif response == "word_of_the_day"
      response = LanguageHelper.daily_word
    elsif response == "tongue_twister"
      response = ExtraContent.tongue_twister
    elsif response == "joke"
      response = ExtraContent.joke
    elsif response == "phrase"
      response = ExtraContent.english_phrase
    end
    response
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
  #   client = call_oxford_dictionary
  #   entry = client.entry[word]
  #   entry.lexical_entries.entries.senses
  # end

  def self.scrape_daily_word
    page = Nokogiri::HTML(open("http://www.learnersdictionary.com/word-of-the-day/"))
    word = page.css('.hw_txt').text
    word = word[0..( word.length/2 - 1)]
    definition = page.css(".midbt p").text
    ary = [word, definition]
  end

  def self.scrape_news
    url = "http://rss.nytimes.com/services/xml/rss/nyt/World.xml"
    times = RSS::Parser.parse(open(url))
    items = []
    headlines = []
    times.channel.items.each do |item|
      items << item
    end
    items.each do |item|
      headlines << item.title
    end
    headlines.sample
  end


  def self.get_learners_word(word)
    key = ENV['MERRIAM_WEBSTER_API_KEY']
    uri = URI("http://www.dictionaryapi.com/api/v1/references/learners/xml/#{word}?key=#{key}")
    Net::HTTP.get(uri)
  end

  def self.watson_init(user)
    if user.nil?
      user_name = "test"
    else
      user_name ="user#{user.id}"
    end
    watson = load_watson
    watson.talk(user_name, "")
  end

private

  def self.load_watson
    manage = Watson::Conversation::ManageDialog.new(username: ENV['W_USERNAME'], password: ENV['W_PASSWORD'], workspace_id: ENV['W_WORKSPACE_ID'], storage: 'hash')
  end

  #returns JSON object
  def self.call_watson(sentence, user)
    if user.nil?
      user_name = "test"
    else
      user_name ="user#{user.id}"
    end
    watson = load_watson

    p sentence
    p "----------------------------------"
    p response = watson.talk(user_name, sentence)
  end

  # def self.call_oxford_dictionary
  #   client = OxfordDictionary::Client.new(ENV['OXFORD_API_ID'], app_key: ENV['OXFORD_API_KEY'])
  #   client = OxfordDictionary.new(ENV['OXFORD_API_ID'], app_key: ENV['OXFORD_API_KEY'])
  # end

end
