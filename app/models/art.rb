class Art < ApplicationRecord

  belongs_to :user
  has_many :final_products
  has_many_attached :images
  
end
