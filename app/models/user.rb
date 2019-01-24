class User < ActiveRecord::Base

  has_many :concerts
  has_many :venues, through: :concerts 
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password_digest, length: { in: 6..20 }

end
