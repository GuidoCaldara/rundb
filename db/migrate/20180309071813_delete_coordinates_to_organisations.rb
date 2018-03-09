class DeleteCoordinatesToOrganisations < ActiveRecord::Migration[5.1]
  def change
      remove_column :organisations, :latitude
      remove_column :organisations, :longitude

  end
end
