class AddNationalIdToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :national_id, :integer
  end
end
