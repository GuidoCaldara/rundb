class RemoveColumnsFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :amount
    remove_column :orders, :status
    add_monetize :orders, :amount, currency: { present: false }
    add_column :orders, :state, :string
    add_column :orders, :race_sku, :string
    add_column :orders, :payment, :jsonb
  end
end
