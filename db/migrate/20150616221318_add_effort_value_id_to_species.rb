class AddEffortValueIdToSpecies < ActiveRecord::Migration
  def change
    add_column :species, :effort_value_id, :integer
  end
end
