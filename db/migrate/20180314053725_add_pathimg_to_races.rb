class AddPathimgToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :pathimg, :string
  end
end
