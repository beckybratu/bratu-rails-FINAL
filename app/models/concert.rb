class Concert < ActiveRecord::Base

  belongs_to :user
  belongs_to :band
  validates :date, presence: true

end
