class RemoveImageFromArts < ActiveRecord::Migration[5.2]
  def change
    remove_column :arts, :image, :string
  end
end
