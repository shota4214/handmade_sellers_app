class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :shops, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :assign_shops, through: :assigns, source: :shop
end
