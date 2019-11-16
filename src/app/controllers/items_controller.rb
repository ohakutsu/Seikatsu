# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :like, :unlike]

  def index
    redirect_to :root
  end

  def show
    @item = Item.find_by_hashid(params[:id])
  end

  def new
    @item = Item.new()
  end

  def edit
    @item = current_user.items.find_by_hashid(params[:id])
  end

  def create
    @item = Item.new(params.require(:item).permit(:title, :body))
    @item.user_id = current_user.id

    if @item.save
      redirect_to @item, notice: "投稿しました"
    else
      render "new"
    end
  end

  def update
    @item = current_user.items.find_by_hashid(params[:id])
    @item.assign_attributes(params.require(:item).permit(:title, :body))

    if @item.save
      redirect_to @item, notice: "記事を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @item = current_user.items.find_by_hashid(params[:id])
    @item.destroy
    redirect_to :items, notice: "記事を削除しました"
  end

  def like
    @item = Item.find_by_hashid(params[:id])
    current_user.voted_items << @item
    redirect_to @item, notice: "いいねしました"
  end

  def unlike
    @item = Item.find_by_hashid(params[:id])
    current_user.voted_items.destroy(@item)
    redirect_to @item, notice: "いいねを削除しました"
  end
end
