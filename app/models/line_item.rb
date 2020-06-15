class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price * quantity
  end
end
