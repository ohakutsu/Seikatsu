class User < ApplicationRecord
  has_many :items, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, length: {
    minimum: 2,
    maximum: 20
  }
  validates :description, length: {
    maximum: 50
  }
end
