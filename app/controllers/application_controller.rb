class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cart?
    !!current_cart
  end
  helper_method :cart?

  def current_cart
    current_user.try(:current_cart)
  end
  helper_method :current_cart
end
