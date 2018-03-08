class ChangeBookableInRaces < ActiveRecord::Migration[5.1]
  def change
    change_column :races, :bookable, :boolean, default: false

  end
end
