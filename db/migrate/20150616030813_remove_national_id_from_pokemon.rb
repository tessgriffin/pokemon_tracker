class RemoveNationalIdFromPokemon < ActiveRecord::Migration
  def change
    remove_column :pokemon, :national_id, :integer
  end
end
