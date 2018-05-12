class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :stripe_txn_id
      t.integer :total_amount
      t.integer :buyer_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
