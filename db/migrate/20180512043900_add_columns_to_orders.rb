class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :unit, :text
    add_column :orders, :city, :string
    add_column :orders, :country, :string
    add_column :orders, :state, :string
    add_column :orders, :postal_code, :integer
    add_column :orders, :phone, :integer
  end
end
