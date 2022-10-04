class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  has_many :productions, dependent: :destroy
  has_many :materials, through: :productions
  accepts_nested_attributes_for :productions, allow_destroy: true
  belongs_to :shop
end