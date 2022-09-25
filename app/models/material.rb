class Material < ApplicationRecord
  mount_uploader :image, MaterialImageUploader
  has_many :units
  has_many :suppliers
  has_many :material_categories, through: :material_category_assigns
  has_many :material_category_assigns, dependent: :destroy
  belongs_to :shop
  validates :name, presence: true, uniqueness: true
  validates :purchase_price, numericality: { only_integer: true }
  validates :purchase_number, numericality: { only_integer: true }
  validates :per_price, numericality: { only_integer: true }
  validates :stock, numericality: { only_integer: true }
end
