class Concert < ActiveRecord::Base

  belongs_to :user
  belongs_to :venue
  validates :date, presence: true
  validates :band_name, presence: true

end
