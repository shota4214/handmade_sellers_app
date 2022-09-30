class Production < ApplicationRecord
  belongs_to :material
  belongs_to :product
end
