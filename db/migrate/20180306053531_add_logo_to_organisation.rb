class AddLogoToOrganisation < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :logo, :string
  end
end
