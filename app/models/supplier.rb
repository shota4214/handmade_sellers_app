class Supplier < ApplicationRecord
  belongs_to :material
  validates :name, presence: true, uniqueness: true
end
