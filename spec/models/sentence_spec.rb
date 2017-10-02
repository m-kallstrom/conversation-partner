require 'rails_helper'

RSpec.describe Sentence, type: :model do
  let(:conversation) {Conversation.create(user_id: 1)}
  let(:sentence) {Sentence.create(content: "I goed to the store", response: "Oh, you went to the store?", conversation: conversation)}

  it "has content from the user" do
    expect(sentence.content).to eq("I goed to the store")
  end

  it "belongs to a conversation" do
    expect(sentence.conversation).to eq(conversation)
  end

  it "has the response as well" do
    expect(sentence.response).to eq("Oh, you went to the store?")
  end
end
