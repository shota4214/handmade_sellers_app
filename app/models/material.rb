class Material < ApplicationRecord
  has_many :units
  has_many :suppliers
  has_many :material_categories, through: :material_category_assigns
  has_many :material_category_assigns, dependent: :destroy
  belongs_to :shop
end
