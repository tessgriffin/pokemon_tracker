require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:user) { User.create!(uid: "123", username: "Ash", email: "ash@example.com")}
  let(:species) { Species.create!(name: "bulbasaur", national_id: "1")}
  let(:nature) { Nature.create!(name: "adamant", increase: "attack", decrease: "special_attack")}
  let(:pokemon) { Pokemon.create!(user_id: user.id, nickname: "bill", species_id: species.id, nature_id: nature.id)}
  
  it "is a valid pokemon" do 
    expect(pokemon).to be_valid
  end

  it "is valid without a nickname, nickname is species name" do 
    pokemon.nickname = nil

    expect(pokemon).to be_valid
    expect(pokemon.nickname).to eq("bulbasaur")
  end

  it "is invalid without a species id" do 
    pokemon.species_id = nil

    expect(pokemon).not_to be_valid
  end

  it "is valid only if level is integer" do 
    pokemon.level = "dog"

    expect(pokemon).not_to be_valid
  end

  it "is valid only if level is between 1 and 100" do 
    pokemon.level = -1
    expect(pokemon).not_to be_valid

    pokemon.level = 1
    expect(pokemon).to be_valid

    pokemon.level = 101
    expect(pokemon).not_to be_valid

    pokemon.level = 100
    expect(pokemon).to be_valid
  end

  it "returns species name" do 
    expect(pokemon.species_name).to eq("bulbasaur")
  end

  it "returns national id" do 
    expect(pokemon.national_id).to eq("1")
  end

  it "returns name of nature" do 
    expect(pokemon.nature_name).to eq("adamant")
  end
end
