require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(uid: "123", username: "Ash", email: "ash@example.com")}

  it "is valid" do 
    expect(user).to be_valid
  end
end
