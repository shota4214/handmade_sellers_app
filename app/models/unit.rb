class Unit < ApplicationRecord
  validates :name, presence: true
  has_many :unit_assigns, dependent: :destroy
  has_many :materials, through: :unit_assigns
end
