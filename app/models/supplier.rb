class Supplier < ApplicationRecord
  validates :name, presence: true
  has_many :supplier_assigns, dependent: :destroy
  has_many :materials, through: :supplier_assigns
  belongs_to :shop
end
