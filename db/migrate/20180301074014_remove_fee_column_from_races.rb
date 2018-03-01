class RemoveFeeColumnFromRaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :races, :fee
    remove_column :races, :discount_fee
  end
end
