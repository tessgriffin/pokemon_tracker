require 'rails_helper'

feature 'new pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }

  # let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}

  it 'creates a new pokemon with default options' do
    Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")
    species = Species.create!(name: "bulbasaur", national_id: "1")
    expect(species).to be_valid

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # visit pokemon_index_path

    # click_on "Add New Pokemon"

    # expect(page).to have_content("Add Pokemon")
    # expect(Pokemon.count).to eq(0)
    # # find_field("A to h").find("option[2]").click
    # select "bulbasaur", from: "A to h" 
    # save_and_open_page
    # click_on "Create Pokemon"

    # # expect(current_path).to eq pokemon_index_path
    # expect(page).to have_content("bulbasaur")
    # expect(Pokemon.count).to eq(1)
  end
end