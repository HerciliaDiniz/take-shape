class LineItem < ApplicationRecord

  belongs_to :final_product
  belongs_to :cart
  belongs_to :order, optional: true

  after_initialize :set_default_quantity

  def total_price
    self.quantity * self.final_product.price
  end

  private

  def set_default_quantity
    self.quantity ||= 1
  end

end
