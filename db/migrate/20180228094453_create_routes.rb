class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.float :lat
      t.float :lng
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
