class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart

  def order_line_items
    LineItem.where(cart_id: self.cart_id)
  end

  def order_item_name_and_quantity
    order_line_items.each_with_object({}) do |line_item, hash|
      hash[line_item.item.title] = line_item.quantity, line_item.item.price
    end
  end

end
