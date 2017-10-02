require 'rails_helper'

RSpec.describe LanguageHelper, type: :model do

  let(:user) {User.create(username: "DarthBob", email: "darthbob@bob.com", password: "bob")}
  let(:conversation) {Conversation.create(user: user)}
  let(:sentence) {Sentence.create(content: "I goed to the store", conversation: conversation)}
  let(:correction) {Correction.create(corrected_sentence: "I went to the store", sentence: sentence)}
  let(:trouble_word) {TroubleWord.create(corrected_word: "went", correction: correction)}

  #I don't think this is going to work online without the env?
  # it "calls gingerice gem to check grammar" do
  #   expect(LanguageHelper.craft_response(sentence.content, user)).to eq "Gingerice: I went to the store ||| Watson: Not Authorized"
  # end

  it "calls EngTagger to get parts of speech" do
    expect(LanguageHelper.get_nouns(sentence.content)).to eq ["store"]
  end
  #debug look up of correct word--functional on activerecord and on live version??
  # it "brings up trouble words for user to try again with" do
  #   expect(LanguageHelper.mention_trouble_word(user)).to eq "Here is a word to review: ."
  # end

end
