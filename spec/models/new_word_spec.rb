require 'rails_helper'

RSpec.describe NewWord, type: :model do
  let(:conversation) {Conversation.create(user_id: 1)}
  let(:new_word) {NewWord.create(word: "Turkey", definition: "A large bird, often eaten for Thanksgiving dinner", conversation: conversation)}

    it "has a chosen word" do
      expect(new_word.word).to eq("Turkey")
    end

    it "has a definition" do
      expect(new_word.definition).to eq("A large bird, often eaten for Thanksgiving dinner")
    end

    it "belongs to a conversation" do
      expect(new_word.conversation).to eq(conversation)
    end
end
