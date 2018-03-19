class AddNameAndSurnameToOrganisations < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :first_name, :string
    add_column :organisations, :last_name, :string
  end
end
