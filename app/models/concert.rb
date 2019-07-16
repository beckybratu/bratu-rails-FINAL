class Concert < ActiveRecord::Base

  has_many :users, through: :user_concerts
  has_many :user_concerts
  belongs_to :venue, optional: true
  validates :date, presence: true
  validates :band_name, presence: true

  accepts_nested_attributes_for :user_concerts

  scope :this_month, -> { where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month) }
  scope :by_this_user, lambda { |current_user| where(:user_id => current_user.id)  }

  scope :past_concerts, -> { where(" date < ?", Date.today.to_s).order(date: :desc)  }

end
