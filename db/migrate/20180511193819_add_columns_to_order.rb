class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :text
    add_column :orders, :payment_method, :string
  end
end
