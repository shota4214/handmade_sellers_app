class Unit < ApplicationRecord
  belongs_to :material
  validates :name, presence: true, uniqueness: true
end
