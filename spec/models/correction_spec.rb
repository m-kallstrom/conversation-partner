require 'rails_helper'

RSpec.describe Correction, type: :model do
  let(:conversation) {Conversation.create(user_id: 1)}
  let(:sentence) {Sentence.create(content: "I goed to the store.", conversation: conversation)}
  let(:correction) {Correction.create(sentence: sentence, corrected_sentence: "I went to the store.")}

    it "has a corrected sentence" do
      expect(correction.corrected_sentence).to eq("I went to the store.")
    end

    it "belongs to a sentence" do
      expect(correction.sentence).to eq(sentence)
    end

end
