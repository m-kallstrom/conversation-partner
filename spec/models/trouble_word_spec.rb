require 'rails_helper'

RSpec.describe TroubleWord, type: :model do
  let(:conversation) {Conversation.create(user_id: 1)}
  let(:sentence) {Sentence.create(content: "I goed to the store", conversation: conversation)}
  let(:correction) {Correction.create(corrected_sentence: "I went to the store", sentence: sentence)}
  let(:trouble_word) {TroubleWord.create(corrected_word: "went", correction: correction)}

  it "has the correct version of the word the user used wrong" do
    expect(trouble_word.corrected_word).to eq("went")
  end

  it "belongs to a correction" do
    expect(trouble_word.correction).to eq(correction)
  end

  describe "definitions" do
    it "returns Array" do
      expect(trouble_word.definitions).to be_a_kind_of(Array)
    end
  end

end
