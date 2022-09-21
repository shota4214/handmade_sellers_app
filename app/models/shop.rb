class Shop < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :shop_link, dependent: :destroy
end
