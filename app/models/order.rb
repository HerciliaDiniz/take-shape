class Order < ApplicationRecord

  has_many :line_items, dependent: :destroy

  validates :total_amount, numericality: { greater_than: 0 }

end
