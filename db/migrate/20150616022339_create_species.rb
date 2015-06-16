class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :national_id

      t.timestamps null: false
    end
  end
end
