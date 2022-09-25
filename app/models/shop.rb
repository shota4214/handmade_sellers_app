class Shop < ApplicationRecord
  mount_uploader :image, ShopImageUploader
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :shop_links, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :assign_users, through: :assigns, source: :user
  has_many :materials, dependent: :destroy

  def invite_member(user)
    assigns.create(user: user)
  end
end
