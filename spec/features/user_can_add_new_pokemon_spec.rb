require 'rails_helper'

feature 'add pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }

  it "lets user add pokemon with default options" do
    Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")
    Species.create!(name: "pikachu", national_id: "25") 

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    expect(Pokemon.count).to eq(0)
    visit pokemon_index_path

    click_on "Add New Pokemon"

    expect(page).to have_content("Add Pokemon")
    select "pikachu", from: "I to r"
    click_on "Create Pokemon"

    # expect(Pokemon.count).to eq(1)
  end
end