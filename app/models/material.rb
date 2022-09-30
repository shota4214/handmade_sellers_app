class Material < ApplicationRecord
  mount_uploader :image, MaterialImageUploader
  has_many :material_category_assigns, dependent: :destroy
  has_many :material_categories, through: :material_category_assigns
  has_many :supplier_assigns, dependent: :destroy
  has_many :suppliers, through: :supplier_assigns
  has_many :unit_assigns, dependent: :destroy
  has_many :units, through: :unit_assigns
  belongs_to :shop
  validates :name, presence: true
  validates :purchase_price, numericality: { only_integer: true }
  validates :purchase_number, numericality: { only_integer: true }
  validates :per_price, numericality: { only_integer: true }
  validates :stock, numericality: { only_integer: true }
end
