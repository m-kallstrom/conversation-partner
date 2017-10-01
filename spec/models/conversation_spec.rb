require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:conversation) {Conversation.create(user_id: 1)}

    it "belongs to a user" do
      expect(conversation.user_id).to eq(1)
    end

end
