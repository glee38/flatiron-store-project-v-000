class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :items, through: :line_items
end
