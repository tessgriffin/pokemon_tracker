class AddSpeciesIdToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :species_id, :integer
  end
end
