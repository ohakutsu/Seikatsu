class Item < ApplicationRecord
  belongs_to :user

  validates :uuid, presence: true, uniqueness: true
  validates :title, presence: true, length: {
    minimum: 1,
    maximum: 20
  }
  validates :body, presence: true, length: {
    minimum: 1,
    maximum: 5000
  }
  validates :user_id, presence: true
end
