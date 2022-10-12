class Material < ApplicationRecord
  mount_uploader :image, MaterialImageUploader
  has_many :material_category_assigns, dependent: :destroy
  has_many :material_categories, through: :material_category_assigns
  has_many :supplier_assigns, dependent: :destroy
  has_many :suppliers, through: :supplier_assigns
  has_many :unit_assigns, dependent: :destroy
  has_many :units, through: :unit_assigns
  has_many :productions, dependent: :destroy
  has_many :products, through: :productions
  belongs_to :shop
  validates :name, presence: true
  validates :purchase_price, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_number, numericality: { greater_than_or_equal_to: 0 }
  validates :per_price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
