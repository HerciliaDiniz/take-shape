class User < ApplicationRecord

  has_many :arts, dependent: :destroy
  has_many :items
  has_many :final_products
  # has_many :images, dependent: :destroy
  
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, last_name, presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX

  enum permission_type: { buyer: 1, artist: 2, admin: 3 }

  def full_name
    "#{first_name} #{last_name}"
  end

end
