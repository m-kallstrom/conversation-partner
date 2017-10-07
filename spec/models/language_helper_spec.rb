require 'rails_helper'

RSpec.describe LanguageHelper, type: :model do

  let(:user) {User.create(username: "DarthBob", email: "darthbob@bob.com", password: "bob")}
  let(:conversation) {Conversation.create(user: user)}
  let(:sentence) {Sentence.create(content: "I goed to the store", conversation: conversation)}
  let(:correction) {Correction.create(corrected_sentence: "I went to the store", sentence: sentence)}
  let(:trouble_word) {TroubleWord.create(corrected_word: "went", correction: correction)}


  it "calls EngTagger to get parts of speech" do
    expect(LanguageHelper.get_nouns(sentence.content)).to eq ["store"]
  end


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




