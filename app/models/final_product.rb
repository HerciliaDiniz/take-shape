class FinalProduct < ApplicationRecord

  belongs_to :user
  belongs_to :art
  belongs_to :item
  has_many :line_items, dependent: :destroy

  has_many_attached :images

  validates :price, numericality: { greater_than: 0 }
  before_validation :calculate_final_product_price

  def calculate_final_product_price
    self.price = self.item.price + self.art.price
  end
  
end
