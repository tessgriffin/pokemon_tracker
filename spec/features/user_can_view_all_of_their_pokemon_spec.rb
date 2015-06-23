require 'rails_helper'

feature 'view all pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:species1) { Species.create!(name: "pikachu", national_id: "25")}
  let(:species2) { Species.create!(name: "bulbasaur", national_id: "1")}


  it "lets the user view all created pokemon" do 
    Pokemon.create!(user_id: user.id, species_id: species1.id, nature_id: nature.id)
    Pokemon.create!(user_id: user.id, species_id: species2.id, nature_id: nature.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit pokemon_index_path

    expect(page).to have_content("pikachu")
    expect(page).to have_content("bulbasaur")
  end
end