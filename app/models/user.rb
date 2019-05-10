class User < ActiveRecord::Base

  has_many :user_concerts
  has_many :concerts, through: :user_concerts
  has_many :venues, through: :concerts
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true
  accepts_nested_attributes_for :concerts
  #validates :password_digest, length: { in: 6..20 }

end
