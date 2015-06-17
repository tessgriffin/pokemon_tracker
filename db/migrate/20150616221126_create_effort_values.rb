class CreateEffortValues < ActiveRecord::Migration
  def change
    create_table :effort_values do |t|
      t.string :stat
      t.integer :amount

      t.timestamps null: false
    end
  end
end
