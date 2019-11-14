# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @ranking_items = Item.week_ranking()
  end

  def latest
    @latest_items = Item.latest()
  end
end
