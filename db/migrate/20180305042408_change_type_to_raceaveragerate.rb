class ChangeTypeToRaceaveragerate < ActiveRecord::Migration[5.1]
  def change
    change_column :races, :race_avg_rate, :integer
  end
end
