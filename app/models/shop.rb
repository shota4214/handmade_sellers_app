class Shop < ApplicationRecord
  mount_uploader :image, ShopImageUploader
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :shop_links, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :assign_users, through: :assigns, source: :user
  has_many :materials, dependent: :destroy
  has_many :material_categories, dependent: :destroy
  has_many :units, dependent: :destroy
  has_many :suppliers, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 100}
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

  def invite_member(user)
    assigns.create(user: user)
  end
end
