# frozen_string_literal: true

class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_items, through: :votes, source: :item
  has_one_attached :profile_image
  attribute :new_profile_image
  attribute :remove_profile_image, :boolean

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

  validate if: :new_profile_image do
    if new_profile_image.respond_to?(:content_type)
      unless new_profile_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_image, :invalid_image_type)
      end
    else
      errors.add(:new_profile_image, :invalid)
    end
  end

  before_save do
    if new_profile_image
      self.profile_image = new_profile_image
    elsif remove_profile_image
      self.profile_image.purge
    end
  end
end
