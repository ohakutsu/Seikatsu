# frozen_string_literal: true

class Item < ApplicationRecord
  class << self
    def week_ranking
      a_week_ago = Time.current - 60*60*24*7
      rel = where("items.created_at >= ?", a_week_ago)
      rel = rel.joins(:votes).group(:id, "votes.item_id").order("count(votes.item_id) desc").limit(10)
      rel
    end
  end

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: {
    minimum: 1,
    maximum: 30
  }
  validates :body, presence: true, length: {
    minimum: 1,
    maximum: 5000
  }
  validates :user_id, presence: true
end
