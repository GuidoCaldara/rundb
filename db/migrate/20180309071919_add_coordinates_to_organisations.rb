class AddCoordinatesToOrganisations < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :latitude, :float
    add_column :organisations, :longitude, :float
  end
end
