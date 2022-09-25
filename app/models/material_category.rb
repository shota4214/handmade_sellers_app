class MaterialCategory < ApplicationRecord
  has_many :material_category_assigns, dependent: :destroy
  has_many :materials, through: :material_category_assigns
  validates :name, presence: true, uniqueness: true
end
