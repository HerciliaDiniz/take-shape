class FinalProduct < ApplicationRecord

  belongs_to :user
  belongs_to :art
  belongs_to :item
  has_many_attached :images

  before_validation :calculate_final_product_price

  def calculate_final_product_price
    self.price = self.item.price + self.art.price
  end
  
end
