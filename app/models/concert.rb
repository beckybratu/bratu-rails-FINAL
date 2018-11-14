class Concert < ActiveRecord::Base

  has_many :tickets
  belongs_to :band

end
