# frozen_string_literal: true

class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_items, through: :votes, source: :item
  has_one_attached :profile_image
  attribute :new_profile_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  validates :name, presence: true, length: {
    minimum: 2,
    maximum: 20
  }
  validates :description, length: {
    maximum: 50
  }

  before_save do
    if new_profile_image
      self.profile_image = new_profile_image
    end
  end
end
