class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new, :index]
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def show
    redirect_to '/'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end