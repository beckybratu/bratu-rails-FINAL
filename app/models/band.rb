class Band < ActiveRecord::Base

  has_many :concerts
  validates :name, presence: true
  validates :name, uniqueness: true

  scope :latest_updated, -> { joins(:concerts) }

end
