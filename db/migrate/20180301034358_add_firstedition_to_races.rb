class AddFirsteditionToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :first_edition, :datetime
  end
end
