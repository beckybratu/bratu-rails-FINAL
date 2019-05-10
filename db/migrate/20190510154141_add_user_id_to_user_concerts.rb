class AddUserIdToUserConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_concerts, :user_id, :integer
  end
end
