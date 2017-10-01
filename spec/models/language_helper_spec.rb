require 'rails_helper'

RSpec.describe LanguageHelper, type: :model do
  let(:user) {User.create(username: "DarthBob", email: "darthbob@bob.com", password: "bob")}

  it "has a username" do
    expect(user.username).to eq("DarthBob")
  end

  it "has an email" do
    expect(user.email).to eq("darthbob@bob.com")
  end

  it "does not save the plaintext password" do
    expect(user.password_digest).not_to eq("bob")
  end
end
