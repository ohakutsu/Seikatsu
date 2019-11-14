# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    redirect_to :root
  end

  def show
    @item = Item.find_by_hashid(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
