class ChangePathColumnRoute < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :path
    add_column :routes, :pathfile, :jsonb

  end
end
