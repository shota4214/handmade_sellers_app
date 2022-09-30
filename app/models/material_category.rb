class MaterialCategory < ApplicationRecord
  has_many :material_category_assigns, dependent: :destroy
  has_many :materials, through: :material_category_assigns
  belongs_to :shop
  validates :name, presence: true
end
