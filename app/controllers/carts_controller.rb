class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
  end

  def create
  end

  def checkout
    current_cart.checkout
    current_user.current_cart.destroy
    flash[:notice] = "Order successfully submitted."
    redirect_to cart_path(current_cart)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
