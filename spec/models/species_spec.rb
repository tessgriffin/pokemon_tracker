require 'rails_helper'

RSpec.describe Species, type: :model do
  let(:species) { Species.create!(name: "bulbasaur", national_id: "1")}
  
  it "is a valid species" do 
    expect(species).to be_valid
  end

  it "is not valid without a name" do 
    species.name = ""

    expect(species).not_to be_valid
  end

  it "is not valid without a national id" do 
    species.national_id = ""

    expect(species).not_to be_valid
  end

  it "is valid if an effort value id is present" do 
    species.effort_value_id = 1

    expect(species).to be_valid
  end

  it "is invalid with incorrect effort value id" do 
    species.effort_value_id = "dog"

    expect(species).not_to be_valid
  end

  it "returns species with names from the alphabet in order" do 
    Species.create!(name: "bulbasaur", national_id: "1")
    Species.create!(name: "ivysaur", national_id: "2")
    Species.create!(name: "venusaur", national_id: "3")

    expect(Species.a_h.first.name).to eq("bulbasaur")
    expect(Species.i_r.first.name).to eq("ivysaur")
    expect(Species.s_z.first.name).to eq("venusaur")
  end
end