require 'rails_helper'

feature 'level up' do
  let(:user) { User.create!(uid: "123",
                            username: "Ash Ketchum",
                            email: "catchem@example.com")
                            }
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:species1) { Species.create!(name: "pikachu", national_id: "25")}

  it "lets the user level up pokemon" do 
    pikachu = Pokemon.new(user_id: user.id, species_id: species1.id, nature_id: nature.id)
    pikachu.stats["hp"] = 45
    pikachu.save!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit pokemon_path(pikachu)

    expect(page).to have_content("pikachu")
    expect(page).to have_content("45")

    fill_in("pokemon_stats[hp]", with: "5")
    fill_in("pokemon_stats[attack]", with: "10")
    click_on("Level Up!")

    expect(page).to have_content("50")
    expect(page).to have_content("10")
    expect(page).to have_content("2")
  end
end