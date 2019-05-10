class Concert < ActiveRecord::Base

  has_many :users, through: :user_concerts
  has_many :user_concerts
  belongs_to :venue, optional: true
  validates :date, presence: true
  validates :band_name, presence: true

  accepts_nested_attributes_for :user_concerts


end
