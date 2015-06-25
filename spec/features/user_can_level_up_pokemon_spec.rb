require 'rails_helper'

feature 'level up pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:species) { Species.create!(name: "pikachu", national_id: "25")}
  let!(:pikachu) { Pokemon.create!(user_id: user.id, species_id: species.id, nature_id: nature.id)}

  it "lets user level up pokemon" do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit pokemon_path(pikachu)
    expect(page).not_to have_content("34")

    fill_in "pokemon_stats[hp]", with: 1
    fill_in "pokemon_stats[attack]", with: 2
    fill_in "pokemon_stats[defense]", with: 34

    click_button "Level Up!"
    
    expect(page).to have_content("Successfully Leveled Up")
    expect(page).to have_content("34")
  end
end