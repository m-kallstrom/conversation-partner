require 'rails_helper'

RSpec.describe Switchboard, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    let(:instance) {Switchboard.new}

  describe "self.get_definition(word)" do
    it "returns Array" do
      expect(Switchboard.get_definition("word")).to be_a_kind_of(Array)
    end
  end

  # describe "self.oxford_dictionary_response(word)" do
  #   it "returns string" do
  #     expect(Switchboard.oxford_dictionary_response("word")).to be_a_kind_of(String)
  #   end
  # end

  describe "self.scrape_daily_word" do
    it "returns array of 2 items" do
      expect(Switchboard.scrape_daily_word.length).to eq(2)
    end

    it "returns 2 strings in the array" do
      expect(Switchboard.scrape_daily_word[0] && Switchboard.scrape_daily_word[1]).to be_a_kind_of(String)
    end
  end

  describe "self.scrape_news" do
    it "returns string" do
      expect(Switchboard.scrape_news).to be_a_kind_of(String)
    end
  end

  describe "self.get_learners_word(word)" do
    it "returns string" do
      expect(Switchboard.get_learners_word("word")).to be_a_kind_of(String)
    end
  end

end
