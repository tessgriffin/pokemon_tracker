require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(uid: "123", username: "Ash", email: "ash@example.com")}

  it "is valid with valid parameters" do 
    expect(user).to be_valid
  end

  it "is invalid without a nickname" do 
    user.username = ""

    expect(user).not_to be_valid
  end
end
