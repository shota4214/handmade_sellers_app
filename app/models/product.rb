class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  has_many :productions, dependent: :destroy
  has_many :materials, through: :productions
  belongs_to :shop
end
