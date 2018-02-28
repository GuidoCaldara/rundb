class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true
      t.text :description
      t.integer :route_rate
      t.integer :organization_rate
      t.integer :value_for_money

      t.timestamps
    end
  end
end
