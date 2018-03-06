class AddUserDatatoOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :group, :string
    add_column :orders, :gender, :string
    add_column :orders, :city, :string
    add_column :orders, :date_of_birth, :date

  end
end
