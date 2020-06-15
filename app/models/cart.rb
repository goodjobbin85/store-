class Cart < ApplicationRecord
  #belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_item(item)
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item.id)
    end
    current_item
  end

  def total_checkout_price
    sum = 0
    #call to_a on self.line_items because self.line_items return a relation, not an array
    self.line_items.to_a.each do |item|
      sum += item.total_price
    end
    sum
  end
end
