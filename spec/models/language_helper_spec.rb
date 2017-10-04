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

end
