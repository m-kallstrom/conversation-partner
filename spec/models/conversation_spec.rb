require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user) {User.create(username: "DarthBob", email: "darthbob@bob.com", password: "bob")}
  let(:conversation) {Conversation.create(user: user)}
  let(:sentence) {Sentence.create(content: "I goed to the store", conversation: conversation)}
  let(:correction) {Correction.create(corrected_sentence: "I went to the store", sentence: sentence)}
  let(:trouble_word) {TroubleWord.create(corrected_word: "went", correction: correction)}
  let(:new_word) {NewWord.create(word: "Turkey", definition: "A large bird, often eaten for Thanksgiving dinner", conversation: conversation)}

    it "belongs to a user" do
      expect(conversation.user).to eq(user)
    end

    it "has a collection of sentences" do
      expect(conversation.sentences).to include(sentence)
    end

    it "has a collection of corrections for those sentences" do
      expect(conversation.corrections).to include(correction)
    end

    it "has a collection of trouble words taken from the corrections" do
      expect(conversation.trouble_words).to include(trouble_word)
    end

    it "has a new word for each conversation" do
      expect(conversation.new_words).to include(new_word)
    end

end
