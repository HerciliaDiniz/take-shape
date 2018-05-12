class Item < ApplicationRecord

  belongs_to :user
  has_many :final_products
  has_many_attached :images

  validates :price, numericality: { greater_than: 0 }
  
end
