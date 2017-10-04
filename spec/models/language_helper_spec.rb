require 'rails_helper'

RSpec.describe LanguageHelper, type: :model do

  let(:user) {User.create(username: "DarthBob", email: "darthbob@bob.com", password: "bob")}
  let(:conversation) {Conversation.create(user: user)}
  let(:sentence) {Sentence.create(content: "I goed to the store", conversation: conversation)}
  let(:correction) {Correction.create(corrected_sentence: "I went to the store", sentence: sentence)}
  let(:trouble_word) {TroubleWord.create(corrected_word: "went", correction: correction)}

  #I don't think this is going to work online without the env?
  it "calls gingerice gem to check grammar" do
    expect(LanguageHelper.craft_response(sentence.content, user)).to eq("Gingerice: I went to the store ||| Watson: This is the shopping route.").or eq("Gingerice: I went to the store ||| Watson: Not Authorized")
  end

  it "calls EngTagger to get parts of speech" do
    expect(LanguageHelper.get_nouns(sentence.content)).to eq ["store"]
  end

  #debug look up of correct word--functional on activerecord and on live version??
  # it "brings up trouble words for user to try again with" do
  #   user = User.create!(username: "bob", email: "bob@bob.com", password: "123456")
  #   tr_words = TroubleWord.create(corrected_word: "helo")
  #   tr_word2 = TroubleWord.create(corrected_word: "heloy")
  #   user.trouble_words << tr_words
  #   user.trouble_words.push << tr_word2
  #   expect(LanguageHelper.mention_trouble_word(user)).to eq "Here is a word to review: ."
  # end

  describe "self.news_item" do
    it "returns string" do
      expect(LanguageHelper.news_item).to be_a_kind_of(String)
    end
  end

  describe "self.daily_word" do
    it "returns string" do
      expect(LanguageHelper.daily_word).to be_a_kind_of(String)
    end
  end

  describe "self.get_primary_definition" do
    it "returns string" do
      expect(LanguageHelper.get_primary_definition("word")).to be_a_kind_of(String)
    end
  end

end




