class RemoveSpeciesFromPokemon < ActiveRecord::Migration
  def change
    remove_column :pokemon, :species, :string
  end
end
