class AddNatureIdToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :nature_id, :integer
  end
end
