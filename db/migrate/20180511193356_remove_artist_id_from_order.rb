class RemoveArtistIdFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :artist_id, :integer
  end
end
