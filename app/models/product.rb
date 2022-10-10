class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  has_many :productions, dependent: :destroy
  has_many :materials, through: :productions
  accepts_nested_attributes_for :productions, allow_destroy: true
  belongs_to :shop
  validates :product_stock, numericality: { greater_than_or_equal_to: 1 }
end
