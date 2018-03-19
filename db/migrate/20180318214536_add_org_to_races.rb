class AddOrgToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :org, :string
  end
end
