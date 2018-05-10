class AddArtReferenceToFinalProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :final_products, :art, foreign_key: true
  end
end
