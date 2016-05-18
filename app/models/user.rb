class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :carts
  has_many :items, through: :carts
  has_many :orders
  has_one :current_cart, class_name: 'Cart'

end
