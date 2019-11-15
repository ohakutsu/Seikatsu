# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by_hashid(params[:id])
    @user_items = @user.items.order(created_at: :desc)
  end
end
