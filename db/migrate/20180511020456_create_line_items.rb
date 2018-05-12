class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :final_product, foreign_key: true
      t.references :cart, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
