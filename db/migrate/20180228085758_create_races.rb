class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :distance
      t.integer :elevation
      t.datetime :date
      t.string :category
      t.string :location
      t.float :latitude
      t.float :longitude
      t.datetime :starting_time
      t.integer :discount_fee
      t.integer :fee
      t.datetime :discount_fee_finish
      t.datetime :subscription_start
      t.datetime :subscription_end
      t.string :photos
      t.text :goodies
      t.integer :capacity
      t.text :description
      t.boolean :bookable, default:true
      t.string :website
      t.string :subscription_link
      t.references :organisation, foreign_key: true
      t.timestamps
    end
  end
end
