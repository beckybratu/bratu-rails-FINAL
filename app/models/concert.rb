class Concert < ActiveRecord::Base

  belongs_to :user
  validates :date, presence: true
  validates :band_name, presence: true

end
