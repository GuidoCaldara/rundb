class CreateOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
