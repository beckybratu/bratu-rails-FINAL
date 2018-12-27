class Band < ActiveRecord::Base

  has_many :concerts
  validates :name, presence: true
  validates :name, uniqueness: true

end
