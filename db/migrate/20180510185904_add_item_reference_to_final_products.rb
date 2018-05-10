class AddItemReferenceToFinalProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :final_products, :item, foreign_key: true
  end
end
