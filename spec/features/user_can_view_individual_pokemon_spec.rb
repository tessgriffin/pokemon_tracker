require 'rails_helper'

feature 'view one pokemon' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:species1) { Species.create!(name: "pikachu", national_id: "25")}

  it "lets the user view all created pokemon" do 
    pikachu = Pokemon.new(user_id: user.id, species_id: species1.id, nature_id: nature.id)
    pikachu.stats["hp"] = 45
    pikachu.save!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit pokemon_path(pikachu)

    expect(page).to have_content("pikachu")
    expect(page).to have_content("45")
  end
end