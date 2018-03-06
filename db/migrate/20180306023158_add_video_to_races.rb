class AddVideoToRaces < ActiveRecord::Migration[5.1]
  def change
        add_column :races, :video, :string
            remove_column :races, :photos
                change_column :races, :starting_time, :datetime



  end
end
