class Cart < ActiveRecord::Base
  belongs_to :user
  has_one :order
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    new_line_item = self.line_items.find_or_initialize_by(item_id: item)
    if new_line_item.quantity.nil?
      new_line_item.quantity = 1
    else
      new_line_item.quantity += 1
    end
    new_line_item
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      total += (item.price * line_item.quantity)
    end
    total
  end
 # self.items.sum(:price)

  def checkout
    self.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory -= line_item.quantity
      item.save
    end
    self.status = "submitted"
    order = self.build_order
    order.user = self.user
    self.save
  end
end
