class AddStartingPointToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :starting_point, :string
  end
end
