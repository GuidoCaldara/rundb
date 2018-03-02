class UpdateDateStampRaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :races, :date_stamp, :integer
    add_column :races, :date_stamp, :float
  end
end
