class RemoveImageFromFinalProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :final_products, :image, :string
  end
end
