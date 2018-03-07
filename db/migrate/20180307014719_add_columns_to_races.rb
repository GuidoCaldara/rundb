class AddColumnsToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :route_rate_avg, :float
    add_column :races, :organisation_rate_avg, :float
    add_column :races, :value_for_money_avg, :float
  end
end
