class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if cart?
      line_item = current_user.current_cart.add_item(params[:item_id])
    else
      current_user.current_cart = current_user.carts.create
      line_item = current_user.current_cart.add_item(params[:item_id])
    end
    line_item.save
    redirect_to cart_path(current_cart.id)
  end

end
