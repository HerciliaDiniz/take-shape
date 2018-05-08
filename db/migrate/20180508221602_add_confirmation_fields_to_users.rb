class AddConfirmationFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :token, :string
    add_index :users, :token
  end
end
