# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
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
    @item = Item.find_by_hashid(params[:id])
  end

  def create
    @item = Item.new(params.require(:item).permit(:title, :body, :user_id))
    @item.user_id = 1

    if @item.save
      redirect_to @item, notice: "投稿しました"
    else
      render "new"
    end
  end

  def update
    @item = Item.find_by_hashid(params[:id])
    @item.assign_attributes(params.require(:item).permit(:title, :body, :user_id))
    @item.user_id = 2

    if @item.save
      redirect_to @item, notice: "記事を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find_by_hashid(params[:id])
    @item.destroy
    redirect_to :items, notice: "記事を削除しました"
  end
end
