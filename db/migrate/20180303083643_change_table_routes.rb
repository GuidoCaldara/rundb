class ChangeTableRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :lat
    remove_column :routes, :lng
    add_column :routes, :path, :text, array: true, default: []
  end
end
