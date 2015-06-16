class RemoveNatureFromPokemon < ActiveRecord::Migration
  def change
    remove_column :pokemon, :nature, :string
  end
end
