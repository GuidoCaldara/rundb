class AddSkuToRaces < ActiveRecord::Migration[5.1]
  def change
      add_column :races, :sku, :string
  end
end
