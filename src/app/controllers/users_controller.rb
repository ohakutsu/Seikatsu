# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by_hashid(params[:id])
    @user_items = @user.items.order(created_at: :desc).page(params[:page]).per(5)
  end

  def voted
    @user = User.find_by_hashid(params[:id])
    @user_voted_items = @user.voted_items.order(created_at: :desc).page(params[:page]).per(5)
  end
end
