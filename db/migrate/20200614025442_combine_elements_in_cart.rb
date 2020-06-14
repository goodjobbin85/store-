class CombineElementsInCart < ActiveRecord::Migration[6.0]

  def up
    #combine many line_items that reference the same item into 1 line_item,
    #for all items of all carts
    Cart.all.each do |cart|
      #count the number of occurrences of each item in the cart
      item_sum = cart.line_items.group(:item_id).sum(:quantity)
      item_sum.each do |item_id, quantity|
        if quantity > 1
        #remove all individual copies of the item
        cart.line_items.where(item_id: item_id).delete_all
        #replace with a single item and with the appropriate quantity
        item = cart.line_items.build(item_id: item_id)
        item.quantity = quantity
        item.save!
      end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          item_id: line_item.item_id,
          quantity: 1
        )
      end
      line_item.destroy
    end
  end
end
