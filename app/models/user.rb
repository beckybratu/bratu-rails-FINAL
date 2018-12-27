class User < ActiveRecord::Base

  has_many :concerts
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password_digest, length: { in: 6..20 }

end
