class Venue < ActiveRecord::Base

  has_many :concerts
  validates :name, presence: true
  validates_uniqueness_of :name

end
