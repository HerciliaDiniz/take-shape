class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :image
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
