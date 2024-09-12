# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    redirect_to books_path unless user.id == current_user.id

    @user = User.find(params[:id])
  end
end
