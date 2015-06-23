require 'rails_helper'

feature 'delete pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:species) { Species.create!(name: "pikachu", national_id: "25")}

  it "lets user destroy their pokemon" do 
    Pokemon.create!(user_id: user.id, species_id: species.id, nature_id: nature.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit pokemon_index_path

    expect(page).to have_content("pikachu")
    expect(Pokemon.count).to eq(1)
    
    click_on "Delete"

    expect(Pokemon.count).to eq(0)
  end
end