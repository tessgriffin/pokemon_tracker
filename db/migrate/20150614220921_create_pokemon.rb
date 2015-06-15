class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.belongs_to :user, index: true, foreign_key: true, required: true
      t.string :nickname
      t.string :species
      t.string :nature
      t.jsonb :stats, default: { hp: 0, attack: 0, special_attack: 0, defense: 0, special_defense: 0, speed: 0 }
      t.jsonb :evs, default: { hp: 0, attack: 0, special_attack: 0, defense: 0, special_defense: 0, speed: 0 }
      t.integer :level, default: 1

      t.timestamps null: false
    end
  end
end
