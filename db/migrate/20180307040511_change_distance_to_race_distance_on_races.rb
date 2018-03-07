class ChangeDistanceToRaceDistanceOnRaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :races, :distance
    add_column :races, :race_distance, :integer
  end
end
