class AddConcertIdToUserConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_concerts, :concert_id, :integer
  end
end
