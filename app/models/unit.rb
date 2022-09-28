class Unit < ApplicationRecord
  belongs_to :shop
  has_many :materials
  validates :name, presence: true
end
