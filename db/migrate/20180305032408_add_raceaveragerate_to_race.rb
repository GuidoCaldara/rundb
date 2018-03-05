class AddRaceaveragerateToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :race_avg_rate, :integer
  end
end
