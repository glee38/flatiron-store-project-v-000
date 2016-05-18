class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.try(:orders)
  end

  def show
    if current_user.orders.any?
      @order = current_user.orders.find(params[:id])
      @order_items_hash = @order.order_item_name_and_quantity
    else
      flash[:notice] = "You have not yet made any orders."
      redirect_to orders_path
    end
  end
end
