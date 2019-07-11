class AddRatingToUserConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_concerts, :rating, :integer
  end
end
