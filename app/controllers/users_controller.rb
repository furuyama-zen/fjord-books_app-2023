class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  
    @user = User.find(params[:id])
  end
end
